[Mesh]
    type = GeneratedMesh
    dim = 3
    nx = 100
    ny = 100
    nz = 10
    xmax = 10
    ymax = 10
    zmax = 0.25
[]
[Variables]
    [diffusion]
    []
[]
[Kernels]
    [diff]
        type = ADMatDiffusion
        variable = diffusion
        diffusivity = 2.3e-5 # Diffusivity of Iron
    []
[]

[BCs]
    [bottom]
        type = ADDirichletBC
        variable = diffusion
        boundary = 'bottom'
        value = 1000
    []
    [top]
        type = ADDirichletBC
        variable = diffusion
        boundary = 'top'
        value = 0
    []
[]

[Executioner]
    type = Steady
    solve_type = NEWTON
[]

[Outputs]
    exodus = true
[]