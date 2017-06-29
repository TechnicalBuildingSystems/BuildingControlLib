# -*- coding: utf-8 -*-
"""
Created on Thu Nov 17 12:03:57 2016

@author: geos
"""

import os
import buildingspy.development.regressiontest as r

pathToWorkingDir = os.path.join( 'D:/' '09_git_local_checkout' , '04_developedBuiCtrl' , 'trunk' , 'BuildingControlLib-dev' , 'BuildingControlLib' )
os.chdir( pathToWorkingDir )
print os.getcwd()

rt = r.Tester()
#myMoLib = os.path.join("buildingspy", "tests", "MyModelicaLibrary")
#rt.setLibraryRoot(myMoLib)

print rt.getLibraryName()
rt.run() 


