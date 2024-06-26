
[GlobalParams]
  displacements = 'disp_x disp_y disp_z'
[]

[Mesh]
  [2DCircle]
    type = ConcentricCircleMeshGenerator
    has_outer_square = false
    num_sectors = 4
    preserve_volumes = true
    radii = .127
    rings = 3
  []
  [Circle]
    type = MeshExtruderGenerator
    input = 2DCircle
    extrusion_vector = '0 0 0.00635'
  []
[]

[Physics]

  [SolidMechanics]

    [QuasiStatic]
      [all]
        add_variables = true
      []
    []
  []
[]

[BCs]
  [bottom_x]
    type = DirichletBC
    variable = disp_x
    boundary = outer
    value = 0
  []
  [bottom_y]
    type = DirichletBC
    variable = disp_y
    boundary = outer
    value = 0
  []
  [bottom_z]
    type = DirichletBC
    variable = disp_z
    boundary = outer
    value = 0
  []
  [Pressure]
    [2]
      boundary = 2
      function = 1e7*t
    []
  []
[]

[Materials]
  [elasticity]
    type = ComputeIsotropicElasticityTensor
    youngs_modulus = 1e9
    poissons_ratio = 0.3
  []
  [stress]
    type = ComputeLinearElasticStress
  []
[]

# consider all off-diagonal Jacobians for preconditioning
[Preconditioning]
  [SMP]
    type = SMP
    full = true
  []
[]

[Executioner]
  type = Transient
  # we chose a direct solver here
  # petsc_options_iname = '-pc_type'
  # petsc_options_value = 'lu'
  end_time = 3
  dt = .25
[]

[Outputs]
  exodus = true
[]