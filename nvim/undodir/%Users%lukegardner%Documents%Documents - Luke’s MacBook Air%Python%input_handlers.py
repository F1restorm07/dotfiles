Vim�UnDo� t�cHi��4Ns�r�]9$(&��n��AXIv�      %    elif key.vk == libtcod.KEY_RIGHT:                             `ɐ�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             `ɐK     �                   5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `ɐU     �                  #!usr/bin/env python35�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `ɐV     �                  5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `ɐ`     �                 import tcod5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `ɐ`     �                  5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `ɐi     �                 def handle_keys(key):5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `ɐx     �                     if key.vk == tcod.KEY_UP:5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                             `ɐ�     �                          return {'move': (0, -1)}5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             `ɐ�     �                     elif�               5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                             `ɐ�     �      	         (        elif key.vk == libtcod.KEY_DOWN:5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             `ɐ�     �                         return {'move': (1, 0)}5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `ɐ�     �                     5�_�                       -    ����                                                                                                                                                                                                                                                                                                                                                             `ɐ�     �                 -    if key.vk == tcod.KEY_ENTER and key.lalt:5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                             `ɐ�     �                 #        return {'fullscreen': True}5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                             `ɐ�     �                 #    elif key.vk == tcod.KEY_ESCAPE:5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `ɐ�     �                         return {'exit': True}5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `ɐ�    �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `ɐ�     �      	         $    elif key.vk == libtcod.KEY_DOWN:5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                             `ɐ�     �   	            $    elif key.vk == libtcod.KEY_LEFT:5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `ɐ�    �               %    elif key.vk == libtcod.KEY_RIGHT:5��