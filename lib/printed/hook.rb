require_relative 'params'

class Hook < SolidRuby::Printed
  def initialize
  end

  def part(_show)
    c = cube($latch_t*2, $hook_l, $latch_t)
      .center_xy

    res = c

    cy = cylinder(d: 20, id: 15, h: $latch_t)
    cy = place cy, onto: c, face: :bottom, edge: :top
    res += cy.translate(y: -10 + $latch_t/2.0)
    #cy = cylinder(d: 20, h: $latch_t)
    #res += place cy, onto: c, face: :back, edge: :bottom

    latch = cube($latch_l, $latch_t*2, $latch_t)
    latch = place latch, onto: c, face: :back, edge: :center
    latch = latch.fillet(r: 2, edges: :vertical)
    res += latch.translate(x: -$latch_l/2.0 + ($latch_t/2.0), y: -$latch_t/2.0)

    f = fillet(r: 5, h: $latch_t)
    f = place f, onto: c, face: :back, edge: :bottom
    res += f.translate(x: -$latch_t/1.0, y: -$latch_t*1.5)

    f = fillet(r: 7, h: $latch_t + 2)
    f = place f, onto: c, face: :back, edge: :bottom
    res -= f.translate(x: $latch_t, y: $latch_t/2.0, z: -1)

    hl = cube($latch_t*2.0, $latch_l/3.0, $latch_t)
      .center_xy
      .translate(x: -$latch_l + $latch_t*1.5, y: $hook_l/2.0 - $latch_l/6.0)

    res += hl.fillet(r: 2, edges: :vertical)


    f = fillet(r: 3, h: $latch_t)
      .rotate(z: 90)
    f = place f, onto: hl, face: :right, edge: :bottom
    res += f #.translate(x: -$latch_t/1.0, y: -$latch_t*1.5)

    res
  end
end
