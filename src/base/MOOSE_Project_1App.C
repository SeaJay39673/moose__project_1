#include "MOOSE_Project_1App.h"
#include "Moose.h"
#include "AppFactory.h"
#include "ModulesApp.h"
#include "MooseSyntax.h"

InputParameters
MOOSE_Project_1App::validParams()
{
  InputParameters params = MooseApp::validParams();
  params.set<bool>("use_legacy_material_output") = false;
  return params;
}

MOOSE_Project_1App::MOOSE_Project_1App(InputParameters parameters) : MooseApp(parameters)
{
  MOOSE_Project_1App::registerAll(_factory, _action_factory, _syntax);
}

MOOSE_Project_1App::~MOOSE_Project_1App() {}

void 
MOOSE_Project_1App::registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  ModulesApp::registerAllObjects<MOOSE_Project_1App>(f, af, s);
  Registry::registerObjectsTo(f, {"MOOSE_Project_1App"});
  Registry::registerActionsTo(af, {"MOOSE_Project_1App"});

  /* register custom execute flags, action syntax, etc. here */
}

void
MOOSE_Project_1App::registerApps()
{
  registerApp(MOOSE_Project_1App);
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
extern "C" void
MOOSE_Project_1App__registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  MOOSE_Project_1App::registerAll(f, af, s);
}
extern "C" void
MOOSE_Project_1App__registerApps()
{
  MOOSE_Project_1App::registerApps();
}
