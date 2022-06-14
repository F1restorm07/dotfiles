local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local cairo = require("lgi").cairo

local function create_title_button(c, color_focus, color_unfocus, shp)
	local ico = wibox.widget({
		markup = "",
		widget = wibox.widget.textbox,
	})
	local tb = wibox.widget({
		ico,
		forced_width = dpi(16),
		forced_height = dpi(16),
		bg = color_focus .. 80,
		shape = shp,
		widget = wibox.container.background,
	})

	local function update()
		if client.focus == c then
			tb.bg = color_focus
		else
			tb.bg = color_unfocus
		end
	end
	update()

	c:connect_signal("focus", update)
	c:connect_signal("unfocus", update)

	tb:connect_signal("mouse::enter", function()
		local clr = client.focus ~= c and color_focus or color_focus .. 55
		tb.bg = clr
	end)
	tb:connect_signal("mouse::leave", function()
		local clr = client.focus == c and color_focus or color_unfocus
		tb.bg = clr
	end)

	tb.visible = true
	return tb
end

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	local close = create_title_button(c, beautiful.xcolor1, beautiful.xcolor8 .. 55, gears.shape.circle)
	close:connect_signal("button::press", function()
		c:kill()
	end)

	local minimize = create_title_button(c, beautiful.xcolor3, beautiful.xcolor8 .. 55, gears.shape.circle)
	minimize:connect_signal("button::press", function()
		c.minimized = true
	end)

	local maximize = create_title_button(c, beautiful.xcolor2, beautiful.xcolor8 .. 55, gears.shape.circle)
	maximize:connect_signal("button::press", function()
		helpers.maximize(c)
	end)

	-- Titlebars setup
	--------------------

	awful.titlebar(c, { position = "top", size = dpi(45), bg = beautiful.transparent }):setup({
		{
			layout = wibox.layout.align.horizontal,
			{
				{
					close,
					minimize,
					maximize,
					layout = wibox.layout.fixed.horizontal,
					spacing = dpi(10),
				},
				left = dpi(15),
				widget = wibox.container.margin,
			},
			{
				{
					{ -- Title
						align = "center",
						widget = awful.titlebar.widget.titlewidget(c),
					},
					layout = wibox.layout.flex.horizontal,
					spacing = dpi(10),
				},
				left = dpi(10),
				right = dpi(10),
				widget = wibox.container.margin,
				buttons = buttons,
			},
			{
				{
					layout = wibox.layout.fixed.horizontal,
					spacing = dpi(10),
				},
				left = dpi(10),
				right = dpi(10),
				widget = wibox.container.margin,
				buttons = buttons,
			},
		},
		bg = beautiful.titlebar_bg,
		shape = helpers.prrect(beautiful.border_radius, true, true, false, false),
		widget = wibox.container.background,
	})

	awful.titlebar(c, {
		position = "bottom",
		size = dpi(24),
		bg = beautiful.transparent,
	}):setup({
		bg = beautiful.titlebar_bg,
		shape = helpers.prrect(beautiful.border_radius, false, false, true, true),
		widget = wibox.container.background,
	})
end)

	-- Window Shape (https://github.com/awesomeWM/awesome/issues/920)
	--------------------

	local function apply_shape(draw, shape, outer_shape_args, inner_shape_args)

		local geo = draw:geometry()

		local border = beautiful.base_border_width
		local titlebar_height = border
		--local titlebar_height = titlebar.is_enabled(draw) and beautiful.titlebar_height or border

		local img = cairo.ImageSurface(cairo.Format.A1, geo.width, geo.height)
		local cr = cairo.Context(img)

		cr:set_operator(cairo.Operator.CLEAR)
		cr:set_source_rgba(0,0,0,1)
		cr:paint()
		cr:set_operator(cairo.Operator.SOURCE)
		cr:set_source_rgba(1,1,1,1)

		shape(cr, geo.width, geo.height, outer_shape_args)
		cr:fill()
		draw.shape_bounding = img._native

		cr:set_operator(cairo.Operator.CLEAR)
		cr:set_source_rgba(0,0,0,1)
		cr:paint()
		cr:set_operator(cairo.Operator.SOURCE)
		cr:set_source_rgba(1,1,1,1)

		gears.shape.transform(shape):translate(
			border, titlebar_height
		)(
			cr,
			geo.width-border*2,
			geo.height-titlebar_height-border,
			inner_shape_args
		)
		cr:fill()
		draw.shape_clip = img._native

		img:finish()
	end


	local pending_shapes = {}
	local function round_up_client_corners(c, force, reference)
		if not force and ((
			-- @TODO: figure it out and uncomment
			not beautiful.client_border_radius or beautiful.client_border_radius == 0
		) or (
			not c.valid
		) or (
			c.fullscreen
		) or (
			pending_shapes[c]
		) or (
			#c:tags() < 1
		)) or beautiful.skip_rounding_for_crazy_borders then
			--clog('R1 F='..(force or 'nil').. ', R='..(reference or '')..', C='.. (c and c.name or '<no name>'), c)
			return
		end
		--clog({"Geometry", c:tags()}, c)
		pending_shapes[c] = true
		delayed_call(function()
			local client_tag = choose_tag(c)
			if not client_tag then
				nlog('no client tag')
				return
			end
			local num_tiled = get_num_tiled(client_tag)
			--clog({"Shape", num_tiled, client_tag.master_fill_policy, c.name}, c)
			--if not force and (c.maximized or (
			if (
				c.maximized or c.fullscreen
			or (
				(num_tiled<=1 and client_tag.master_fill_policy=='expand')
				and not c.floating
				and client_tag.layout.name ~= "floating"
			)) then
				pending_shapes[c] = nil
				--nlog('R2 F='..(force and force or 'nil').. ', R='..reference..', C='.. c.name)
				return
			end
			-- Draw outer shape only if floating layout or useless gaps
			local outer_shape_args = 0
			if client_tag.layout.name == "floating" or client_tag:get_gap() ~= 0 then
				outer_shape_args = beautiful.client_border_radius
			end
			local inner_shape_args = beautiful.client_border_radius*0.75
			--local inner_shape_args = beautiful.client_border_radius - beautiful.base_border_width
			--if inner_shape_args < 0 then inner_shape_args = 0 end
			apply_shape(c, gears.shape.rounded_rect, outer_shape_args, inner_shape_args)
			--clog("apply_shape "..(reference or 'no_ref'), c)
			pending_shapes[c] = nil
			--nlog('OK F='..(force and "true" or 'nil').. ', R='..reference..', C='.. c.name)
		end)
	end

	return {
		round_up_client_corners=round_up_client_corners,
	}
