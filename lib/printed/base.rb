require_relative 'params'

class Base < SolidRuby::Printed
  def initialize(horizontal=true)
    @horizontal = horizontal
  end

  def triangle_brace()
    triangle(beta: 90, c: $anchor_t + $base_z, a: @x/2.0 - @a_w)
      .linear_extrude(h: $anchor_t)
      .rotate(x: 90)
      .translate(
          x: @a_w/2.0 -0.01,
          y: -@a_l/2.0 + $anchor_t,
          z: $base_z - 0.01)
  end

  def part(_show)
    if @horizontal
      @x = $base_x
      @y = $base_y
      @a_w = $anchor_w
      @a_l = $anchor_l
    else
      @x = $base_y
      @y = $base_x
      @a_w = $anchor_w
      @a_l = $base_x * 0.9
    end

    res = cube(@x, @y, $base_z)
      .center_xy
      .fillet(r: 2, edges: :vertical)

    res += cube(@a_w, @a_l, $base_z + $anchor_t)
      .center_xy
      .translate(z: $base_z - 0.01)

    res -= cube(@a_w + 1, @a_l - $anchor_t*2, $anchor_t)
      .center_xy
      .fillet(r: 2, top: [:top, :bottom], bottom: [:top, :bottom])
      .translate(z: $base_z+0.01)

    res += triangle_brace
    res += triangle_brace.mirror(x: 1)
    res += triangle_brace.mirror(y: 1)
    res += triangle_brace.mirror(y: 1).mirror(x: 1)

    res += fillet(r: 2, h: @x - @a_w*2)
      .rotate(y: 90)
      .translate(
        x: -@x/2.0 + @a_w/1.0,
        y: -@a_l/2.0 + 2,
        z: $base_z - 0.01)

    res += fillet(r: 2, h: @x - @a_w*2)
      .rotate(y: 90)
      .translate(
        x: -@x/2.0 + @a_w/1.0,
        y: -@a_l/2.0,
        z: $base_z - 0.01)
      .mirror(y: 1)

    res
  end
end
