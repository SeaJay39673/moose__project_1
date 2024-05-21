//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html
#include "MOOSE_Project_1TestApp.h"
#include "MOOSE_Project_1App.h"
#include "Moose.h"
#include "AppFactory.h"
#include "MooseSyntax.h"

InputParameters
MOOSE_Project_1TestApp::validParams()
{
  InputParameters params = MOOSE_Project_1App::validParams();
  params.set<bool>("use_legacy_material_output") = false;
  return params;
}

MOOSE_Project_1TestApp::MOOSE_Project_1TestApp(InputParameters parameters) : MooseApp(parameters)
{
  MOOSE_Project_1TestApp::registerAll(
      _factory, _action_factory, _syntax, getParam<bool>("allow_test_objects"));
}

MOOSE_Project_1TestApp::~MOOSE_Project_1TestApp() {}

void
MOOSE_Project_1TestApp::registerAll(Factory & f, ActionFactory & af, Syntax & s, bool use_test_objs)
{
  MOOSE_Project_1App::registerAll(f, af, s);
  if (use_test_objs)
  {
    Registry::registerObjectsTo(f, {"MOOSE_Project_1TestApp"});
    Registry::registerActionsTo(af, {"MOOSE_Project_1TestApp"});
  }
}

void
MOOSE_Project_1TestApp::registerApps()
{
  registerApp(MOOSE_Project_1App);
  registerApp(MOOSE_Project_1TestApp);
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
// External entry point for dynamic application loading
extern "C" void
MOOSE_Project_1TestApp__registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  MOOSE_Project_1TestApp::registerAll(f, af, s);
}
extern "C" void
MOOSE_Project_1TestApp__registerApps()
{
  MOOSE_Project_1TestApp::registerApps();
}
