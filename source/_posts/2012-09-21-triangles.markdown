---
layout: post
title: "Triangles, Man"
date: 2012-09-21 21:40
comments: true
categories: 
---
Yesterday I was working on building out some arrows to bring attention to content. The request was to have a box with some content with an arrow from the top that makes it look like a speech bubble.

<span class="bubble top_arrow">I came up with this:</span>

``` sass speech bubble arrow http://www.yuiblog.com/blog/2010/11/22/css-quick-tip-css-arrows-and-shapes-without-markup Based on CSS Arrows and Shapes Without Markup
// Colors
$white:             #ffffff
$greya:             #aaaaaa

.bubble
  background:       $white
  border:           1px solid $greya
  padding:          10px
  font-weight:      bold
  position:         relative

.bubble.arrow
  &:before, &:after
    content:        ' '
    height:         0
    width:          0
    position:       absolute
  &:before
    top:            -10px
    left:           87px
    border-left:    10px solid transparent
    border-right:   10px solid transparent
    border-bottom:  10px solid $white
  &:after
    z-index:        -1
    top:            -12px
    left:           85px
    border-left:    12px solid transparent
    border-right:   12px solid transparent
    border-bottom:  12px solid $greya
```
The effect has a diagonal border that follows the arrow as it juts out, and this is done by faking a border, a triangle with a z-index of -1 is placed below the initial triangle. The :before pseudo-element generates a 10px white triangle, while the :after pseudo element generates a background 12px grey triangle.

Not bad, but it's pretty repetitive. Moreover, it's hard to tell from the code that the video bubble's arrow is on the top.

We can express this more clearly and succinctly. First we abstract out the arrow:

``` sass Rewrite step one - note that the values of the existing arrow are used as defaults while structure is set in place.
...
@mixin arrow($size: 10px, $shadow: 1px, $position: 85px)
  $shadow-size:     $size + ($shadow * 2)
  &:before, &:after
    content:        ' '
    height:         0
    width:          0
    position:       absolute
  &:before
    top:            -$size
    left:           $position + ($shadow * 2)
    border-left:    $size solid transparent
    border-right:   $size solid transparent
    border-bottom:  $size solid $white
  &:after
    z-index:        -1
    top:            -$shadow-size
    left:           $position
    border-left:    $shadow-size solid transparent
    border-right:   $shadow-size solid transparent
    border-bottom:  $shadow-size solid $greyc
...
.bubble.arrow
  @include arrow
```
Nothing fancy is going on here, but taking a moment to get the structure in place and check that our math is clear make the next step easier.

It becomes a bit apparent at this point that we're re-using a triangle pattern for both the arrow and it's border. We can shake that out too:

``` sass Bring triangles out of the arrow
...
@mixin triangle($color, $size, $offset)
  top:              -$size
  left:             $offset
  border-left:      $size solid transparent
  border-right:     $size solid transparent
  border-bottom:    $size solid $color

@mixin arrow($size: 10px, $shadow: 1px, $position: 85px)
  $shadow-size:     $size + ($shadow * 2)
  &:before, &:after
    content:        ' '
    height:         0
    width:          0
    position:       absolute
  &:before
    @include triangle($white, $size, $offset + ($shadow * 2))
  &:after
    z-index:        -1
    @include triangle($greyc, $size + ($shadow * 2), $offset)
...
```
It looks pretty good, and then we get another request… Can we make it so the the arrow comes out of the left side in some contexts, too.

First we put in the structure to accommodate a fourth argument, $position:

```
...
@mixin triangle($color, $size, $offset, $position: top)
  @if $position == top
    top:            -$size
    left:           $offset
    border-left:    $size solid transparent
    border-right:   $size solid transparent
    border-bottom:  $size solid $color

@mixin arrow($size, $shadow, $offset, $position)
  &:before, &:after
    content:        ' '
    height:         0
    width:          0
    position:       absolute
  &:before
    @include triangle($white, $size, $offset + ($shadow * 2), $position)
  &:after
    z-index:        -1
    @include triangle($greyc, $size + ($shadow * 2), $offset, $position)

.bubble.arrow
  @include arrow(10px, 1px, 85px, top)
```

Then we can add another conditional for the left arrow, and voila a module arrow giving our dialog boxes a speech bubble playfulness.

``` sass The finished product
@mixin triangle($color, $size, $offset, $position)
  @if $position == top
    top:            -$size
    left:           $offset
    border-left:    $size solid transparent
    border-right:   $size solid transparent
    border-bottom:  $size solid $color
  @if $position == left
    left:           -$size
    top:            $offset
    border-top:     $size solid transparent
    border-bottom:  $size solid transparent
    border-right:   $size solid $color

@mixin arrow($size, $shadow, $offset, $position)
  &:before, &:after
    content:        ' '
    height:         0
    width:          0
    position:       absolute
  &:before
    @include triangle($white, $size, $offset + ($shadow * 2), $position)
  &:after
    z-index:        -1
    @include triangle($greyc, $size + ($shadow * 2), $offset, $position)

.bubble
  background:       $white
  border:           1px solid $greya
  padding:          10px
  font-weight:      bold
  position:         relative

.bubble.top_arrow
  @include arrow(10px, 1px, 85px, top)

.bubble.left_arrow
  @include arrow(10px, 1px, 12px, left)
```
This technique can easily extend to the right and bottom sides of the box, and shows how the flexibility of Sass speeds up development, especially if you can <span class="bubble left_arrow" style="float: right;">break down your styles into small, reusable parts.</span>