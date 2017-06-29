within BuildingControlLib.BuildingControl.VDI3813.UsersGuide;
class GettingStarted "Getting started"
  extends Modelica.Icons.Information;
  annotation (preferredView="info",
  Documentation(info="<html>
<p><b><font style=\"font-size: 12pt; color: #008000; \">Getting Started</font></b></p>
<p>This package includes partial blocks and ready to simulate models of room automation control functions as defined in the standard VDI 3813-2 <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1]</a>.</p>
<p>Within the standard seven main groups of functions are defined:</p>
<ol>
<li><b>Sensor functions</b>: They receive measured physical signals and convert them into a VDI 3813 type. </li>
<p>In the directive you find the following description: &QUOT;Sensor functions (Figure 2) convert physical quantities, either directly or by interpreting electrical signals, to output information which in turn serves as input to application functions or actuator functions. They thus represent the physical input interface of the system with the environment. Matching of the signals or measuring equipment often requires calibration parameters, e. g. for the mapping of characteristic curves and measured-value ranges or for the compensation of zero errors.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.1.1, p. 10]</a></p>
<li><b>Actuator Functions</b>: They receive a setpoint to generate a physical control command for a motor. Moreover they provide the current motor control status. </li>
<p>In the directive you find the following description: &QUOT;Actuator functions (Figure 11) convert input information originating from operator or application functions to physical quantities appropriate to their output interface. They thus represent the physical outputs of the automation system to the environment. As is the case with sensors, the informative representation takes the form of function blocks showing the input information and the corresponding physical output. Additionally, actuator functions supply output information in terms of the current manipulated value of the physical interface.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.2.1, p. 17]</a></p>
<li><b>Common I/O functions</b>: They provide the opportunity of data exchange between different systems or to the human user (internal and external). These functions are highly dependent on the manufacturer and hardware specific implementation. </li>
<p>In the directive you find the following description: &QUOT;I/O functions for joint communicative data points apply to information exchanged with devices of different system installers or with external systems or devices. The scope for interoperability of joint information must be specified in compliance with the selected communication protocol. For the communication with devices or stations for management functions see Section 6.7.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.3.1, p. 23]</a></p>
<li><b>Operator/display functions</b>: They provide status information to the users and give them the ability to take command of automation.</li>
<p>In the directive you find the following description: &QUOT;In room control, operator functions convert operator control actions to output information which is then available as input information to the application functions. Display functions convert output information from application functions or operator functions to visual information informing the user about states of the automation system, e. g. about the controlled variable (actual value) or reference variable (setpoint) of a room temperature control (Figure 15). Operator and display functions thus form the interface for interaction between the room control system and the user.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.4.1, p. 23]</a></p>
<li><b>Application functions</b>: They provide the actual automation functionality by processing incoming information of i.e. sensor or operator functions and transmit new setpoints to actuators. </li>
<p>In the directive you find the following description: &QUOT;Application functions of room control represent the functionality to be achieved by means of automation. They can, therefore, be generally regarded as the link between sensor functions or operator functions on the one hand and actuator functions on the other hand. The behaviour of the application function can often be influenced by means of parameters. The informative representation of an application function also takes the form of a function block. In contrast to sensor, actuator or operator and display functions, it has no physical interface as it merely processes one or several pieces of input information, supplying the result in terms of one or several pieces of output information (Figure 22).&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.5.1, p. 31]</a></p>
<li><b>Management functions</b>: High-level functions to grant an operator interface for the whole building automation system. The description of these functions is faint and can vary widely.</li>
<p>In the directive you find the following description: &QUOT;Management functions are higher-level functions allowing to implement functions for the entire BACS, including room control, to perform operator control actions and to display information on the entire BACS. For reasons of conformity with the BACS function list (see ISO 16 484-3), the terminology used there was adopted.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.7.1, p. 96]</a></p>
<li><b>Operator functions</b>: High-level functions to grant an operator interface for the whole room automation. The description of these functions is faint and can vary widely.</li>
</ol>
<p><br>In the directive you find the following description: &QUOT;Operator functions are higher-level functions which allow operator control actions for the entire room control and the display of information about the entire room control. They are, therefore, operator and display functions, but the term operator functions was chosen to achieve conformity with the BACS function list (see ISO 16 484-3). As a rule, the operator functions are used for the operation.&QUOT; <a href=\"modelica://BuildingControlLib.UsersGuide.References\">[1, section 6.8.1, p. 98]</a></p>
<p><br>In this library the focus is only on four of the groups as these are suited for implementation with proper descriptions of functionalities. The four groups are:</p>
<ul>
<li><h4>Sensor functions </h4></li>
<li><h4>Actuator Functions </h4></li>
<li><h4>Operator/display functions </h4></li>
<li><h4>Application functions</h4></li>
</ul>
<p><br>The basic concept of the underlying software architecture is shown in the next diagram, which is called a class diagramm and is specified in UML standard for structural descriptions of software:</p>
<p><img src=\"modelica://BuildingControlLib/Resources/Images/docUMLStr_FunctionConcept.png\"/></p>
</html>", revisions="<html>
<ul>
<li>March 07, 2017&nbsp; by Georg Ferdinand Schneider &amp; Georg Ambrosius Pe&szlig;ler:<br>Implemented.</li>
</ul>
</html>
"));
end GettingStarted;
