require_relative 'params'

class Base < SolidRuby::Printed
  def initialize(horizontal=true)
    @horizontal = horizontal
  end

  def part(_show)
    res = cube($base_x, $base_y, $base_z)
      .center_xy
      .fillet(r: 2, edges: :vertical)

    if @horizontal
      res += cube($anchor_w, $anchor_l, $base_z + $anchor_t)
        .center_xy
        .fillet(r: 2, edges: :vertical)
        .translate(z: $base_z - 0.01)

      res -= cube($anchor_w + 1, $anchor_l - $anchor_t*2, $anchor_t)
        .center_xy
        .fillet(r: 2, top: [:top, :bottom], bottom: [:top, :bottom])
        .translate(z: $base_z+0.01)
    else
      res += cube($base_x * 0.9, $anchor_w, $base_z + $anchor_t)
        .center_xy
        .fillet(r: 2, edges: :vertical)
        .translate(z: $base_z - 0.01)

      res -= cube($base_x*0.9 - $anchor_t*2, $anchor_w + 1, $anchor_t)
        .center_xy
        .fillet(r: 2, top: [:top, :bottom], bottom: [:top, :bottom])
        .translate(z: $base_z+0.01)
    end
      #.translate(z: 10)
      #.debug

    # res -= cube($base_x, $base_y+2, $base_z*10)
    #   .center_y
    #   .translate(z: -1)

    res
  end
end
