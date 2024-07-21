# Style Test
---

# h1
## h2
### h3
#### h4
##### h5
###### h6

*italic*
**bold**
***bold italic***
~~strikethrough~~

- item
- item 2
- item 3

1. num 1
2. num 2
3. num 3

- [ ] task 1
- [X] completed task

> quote
> quote

[link](https://example.com)
![image](https://example.com)

| Label  | Value |
| ------ | ----- |
| First  | foo   |
| Second | bar   |

`code`

```rs
use std::task;

#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

const TRIG: i32 = -4;

async fn alignof() {}

fn main() {
    let rect1 = Rectangle { width: 30, height: 50 };

    // Some comment
    println!("rect1 is {:?}", rect1);

    let r#type = "valid";
    let i: i128 = 1117;
    let u: Option<&str> = None;

    let s = "March\n
April";
    let s = r"March \
April";

    let s = "String split over\n multiple \
    lines";
}
```
