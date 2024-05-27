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
    [diff]
        type = ADMatDiffusion
        variable = diffusion
        diffusivity = 2.3e-5 # Diffusivity of Iron
    []
[]

[ICs]
    # [circle] # Throws an error
    #     type=SmoothCircleIC
    #     x1=.127
    #     y1=.127
    #     radius=.05
    #     invalue=533.15
    #     outvalue=293.15

    # []
    # [center] # Does not seem to work correctly
    #     type = BoundingBoxIC
    #     variable = diffusion
    #     x1 = .1
    #     y1 = .1
    #     x2 = .154
    #     y2 = .154
    #     inside = 533.15
    #     outside = 293.15
    #     int_width = 0
    # []
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
    type = Steady
    solve_type = NEWTON
[]

[Outputs]
    exodus = true
[]