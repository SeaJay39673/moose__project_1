
[GlobalParams]
    displacements = 'disp_x disp_y disp_z'
[]

# [Mesh] # Eventually use this
#     [2DCircle]
#         type = ConcentricCircleMeshGenerator
#         has_outer_square = false
#         num_sectors = 10
#         preserve_volumes = true
#         radii = .127
#         rings = 10
#     []
#     [Circle]
#         type = MeshExtruderGenerator
#         input = 2DCircle
#         extrusion_vector = '0 0 0.00635'
#     []
# []

[Mesh]
  [generated]
    type = GeneratedMeshGenerator
    dim = 3
    nx = 10
    ny = 10
    nz = 10
    xmax = 2
    ymax = 1
    zmax = 1
  []
[]

[Physics/SolidMechanics/QuasiStatic]
  [all]
    add_variables = true
  []
[]

#
# Added boundary/loading conditions
# https://mooseframework.inl.gov/modules/solid_mechanics/tutorials/introduction/step02.html
#

[BCs]
  [bottom_x]
    type = DirichletBC
    variable = disp_x
    boundary = bottom
    value = 0
  []
  [bottom_y]
    type = DirichletBC
    variable = disp_y
    boundary = bottom
    value = 0
  []
  [bottom_z]
    type = DirichletBC
    variable = disp_z
    boundary = bottom
    value = 0
  []
  [Pressure]
    [top]
      boundary = top
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
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'
  end_time = 50
  dt = 1
[]

[Outputs]
  exodus = true
[]