class DoorlockAssembly < SolidRuby::Assembly

  # Assemblies are used to show how different parts interact on your design.

  # Skip generation of the 'output' method for this assembly.
  # (will still generate 'show')
  skip :output

  def part(show)
    res = Base.new

    res += Hook.new
      .translate(x: 20, y: $hook_l/2.0 + $base_y/2.0, z: $base_z + 0.5)
      #.rotate(x: 45)
      #.translate(y: 40, z: 43.5)

  end
end
