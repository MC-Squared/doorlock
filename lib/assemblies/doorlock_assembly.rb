class DoorlockAssembly < SolidRuby::Assembly

  # Assemblies are used to show how different parts interact on your design.

  # Skip generation of the 'output' method for this assembly.
  # (will still generate 'show')
  skip :output

  def part(show)
    res = Base.new

    res += Hook.new
      .rotate(z: 180)
      .translate(x: 0, y: -$hook_l + $base_y/2.0)
      .rotate(x: -140)
      .translate(y: -10, z: -2)

    res += Base.new(false)
      .rotate(x: 90, y: 90)
      .translate(z: $hook_l - $base_y/2.0,
        y: $hook_l - 7,
        x: 5)
      #.rotate(x: 45)
      #.translate(y: 40, z: 43.5)

  end
end
