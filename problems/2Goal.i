## Units in the input file: m-Pa-s-K-V

[Mesh]
    type = GeneratedMesh
    dim = 3
    nx = 100
    ny = 100
    nz = 10
    xmax = .254 # 10 in -> .254 m
    ymax = .254
    zmax = 0.00635 # 0.25 in -> 0.00635 m
[]
[Variables]
    [diffusion]
    []
[]
[Kernels]
    [time]
        type=TimeDerivative
        variable=diffusion
    []
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
        value = 533.15 # 500 F -> 533.15 K
    []
    [top]
        type=ADDirichletBC
        variable=diffusion
        boundary="top"
        value=0
    []
[]

[Executioner]
    type = Transient
    num_steps = 100
    # solve_type = NEWTON
[]

[Outputs]
    exodus = true
[]