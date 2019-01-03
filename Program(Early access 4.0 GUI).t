import GUI % Must be included in a programs using the GPL

View.Set ("graphics:640;480") % Shrink the window to the minimum size

% The Text Field IDs :
var AssignmentTextField, KnowledgeTextField, ThinkingTextField, CommunicationTextField, ApplicationTextField, KnowledgeWTextField, ThinkingWTextField, CommunicationWTextField, ApplicationWTextField,
    KnowledgeCWTextField, ThinkingCWTextField, CommunicationCWTextField, ApplicationCWTextField, FinalCWTextField, KnowledgeSATextField, ThinkingSATextField, CommunicationSATextField
    , ApplicationSATextField, FinalSATextField : int

% The variables for value accumulating of inputted assignment data.
var SumKnowledge, SumKnowledgeW, SumThinking, SumThinkingW, SumCommunication, SumCommunicationW, SumApplication, SumApplicationW : real := 0

% The variables which is used to determine the assignemnt slide.
var AssignmentNum : int

% Variables used to store datas in the final graph.
var knowledgeW, thinkingW, communicationW, applicationW, finalW, assignmentKnowledgeSA, assignmentThinkingSA, assignmentCommunicationSA, assignmentApplicationSA, assignmentFinalSA, knowledgeCW : real
var AssignmentNumTest, knowledge, thinking, communication, application, final, assignmentFinal, temp : string

% The slider to choose people
var scrollBar : int

% The label for record number
var AssignmentLabel : int

% The first part of the main program. It's used to determine the number of assignment slide.
% Error detection is made to avoid invalid input.
loop
    cls
    locate (1, 1)
    put "How many assignments do you want to enter? " ..
    get AssignmentNumTest
    if strintok (AssignmentNumTest) then
	AssignmentNum := strint (AssignmentNumTest)
	exit
    else
	put "Please enter a interger."
	delay (1000)
    end if
end loop

% The array of data
var data : array 1 .. AssignmentNum of
    record
	knowledge : string
	knowledgeW : string
	thinking : string
	thinkingW : string
	communication : string
	communicationW : string
	application : string
	applicationW : string
    end record

% The array of background datas for calculating.
var calculate : array 1 .. AssignmentNum of
    record
	knowledge : int
	knowledgeW : int
	thinking : int
	thinkingW : int
	communication : int
	communicationW : int
	application : int
	applicationW : int
    end record

% Accumylater for page number.
var numAssignments : int := 1
var currentAssignment : int := 1

% Assign the starting value for string variables.
for i : 1 .. AssignmentNum
    data (i).knowledge := ""
    data (i).knowledgeW := ""
    data (i).thinking := ""
    data (i).thinkingW := ""
    data (i).communication := ""
    data (i).communicationW := ""
    data (i).application := ""
    data (i).applicationW := ""
end for

% Procedure of drawing the final pei chart showing the student's marks.
procedure DrawPieChart
    drawfillarc (503, 137, 121, 121, 0, round (3.6 * knowledgeW), 0)
    drawfillarc (503, 137, 121, 121, round (3.6 * knowledgeW), round (3.6 * knowledgeW) + round (3.6 * thinkingW), 0)
    drawfillarc (503, 137, 121, 121, round (3.6 * knowledgeW) + round (3.6 * thinkingW), round (3.6 * knowledgeW) + round (3.6 * thinkingW) + round (3.6 * communicationW), 0)
    drawfillarc (503, 137, 121, 121, round (3.6 * knowledgeW) + round (3.6 * thinkingW) + round (3.6 * communicationW), round (3.6 * knowledgeW) + round (3.6 * thinkingW) + round (3.6 *
	communicationW) + round (3.6 * applicationW), 0)
    drawfillarc (503, 137, 121, 121, round (3.6 * knowledgeW) + round (3.6 * thinkingW) + round (3.6 * communicationW) +
	round (3.6 * applicationW), round (3.6 * knowledgeW) + round (3.6 * thinkingW) + round (3.6 * communicationW) + round (3.6 * applicationW) + round (3.6 * finalW), 0)

    drawfillarc (503, 137, round (1.21 * assignmentKnowledgeSA), round (1.21 * assignmentKnowledgeSA), 0, round (3.6 * knowledgeW), yellow)
    drawfillarc (503, 137, round (1.21 * assignmentThinkingSA), round (1.21 * assignmentThinkingSA), round (3.6 * knowledgeW), round (3.6 * knowledgeW) + round (3.6 * thinkingW), green)
    drawfillarc (503, 137, round (1.21 * assignmentCommunicationSA), round (1.21 * assignmentCommunicationSA), round (3.6 * knowledgeW) + round (3.6 * thinkingW), round (3.6 * knowledgeW) +
	round (3.6 * thinkingW) + round (3.6 * communicationW), blue)
    drawfillarc (503, 137, round (1.21 * assignmentApplicationSA), round (1.21 * assignmentApplicationSA), round (3.6 * knowledgeW) + round (3.6 * thinkingW) + round (3.6 * communicationW),
	round (3.6 * knowledgeW) + round (3.6 * thinkingW) + round (3.6 * communicationW) + round (3.6 * applicationW), 12)
    drawfillarc (503, 137, round (1.21 * assignmentFinalSA), round (1.21 * assignmentFinalSA), round (3.6 * knowledgeW) + round (3.6 * thinkingW) + round (3.6 * communicationW) +
	round (3.6 * applicationW), round (3.6 * knowledgeW) + round (3.6 * thinkingW) + round (3.6 * communicationW) + round (3.6 * applicationW) + round (3.6 * finalW), 15)

    drawarc (503, 137, 121, 121, 0, round (3.6 * knowledgeW), yellow)
    drawarc (503, 137, 121, 121, round (3.6 * knowledgeW), round (3.6 * knowledgeW) + round (3.6 * thinkingW), green)
    drawarc (503, 137, 121, 121, round (3.6 * knowledgeW) + round (3.6 * thinkingW), round (3.6 * knowledgeW) +
	round (3.6 * thinkingW) + round (3.6 * communicationW), blue)
    drawarc (503, 137, 121, 121, round (3.6 * knowledgeW) + round (3.6 * thinkingW) + round (3.6 * communicationW),
	round (3.6 * knowledgeW) + round (3.6 * thinkingW) + round (3.6 * communicationW) + round (3.6 * applicationW), 12)
    drawarc (503, 137, 121, 121, round (3.6 * knowledgeW) + round (3.6 * thinkingW) + round (3.6 * communicationW) +
	round (3.6 * applicationW), round (3.6 * knowledgeW) + round (3.6 * thinkingW) + round (3.6 * communicationW) + round (3.6 * applicationW) + round (3.6 * finalW), 15)
end DrawPieChart

% Create textfields of the final mark reporter.
procedure KnowledgeCWEntered (text : string)
    knowledge := GUI.GetText (KnowledgeCWTextField)
    knowledgeW := strint (knowledge)
    GUI.SetSelection (ThinkingCWTextField, -1, -1)
    GUI.SetActive (ThinkingCWTextField)
end KnowledgeCWEntered

procedure ThinkingCWEntered (text : string)
    thinking := GUI.GetText (ThinkingCWTextField)
    thinkingW := strint (thinking)
    GUI.SetSelection (CommunicationCWTextField, -1, -1)
    GUI.SetActive (CommunicationCWTextField)
end ThinkingCWEntered

procedure CommunicationCWEntered (text : string)
    communication := GUI.GetText (CommunicationCWTextField)
    communicationW := strint (communication)
    GUI.SetSelection (ApplicationCWTextField, -1, -1)
    GUI.SetActive (ApplicationCWTextField)
end CommunicationCWEntered

procedure ApplicationCWEntered (text : string)
    application := GUI.GetText (ApplicationCWTextField)
    applicationW := strint (application)
    GUI.SetSelection (FinalCWTextField, -1, -1)
    GUI.SetActive (FinalCWTextField)
end ApplicationCWEntered

procedure FinalCWEntered (text : string)
    final := GUI.GetText (FinalCWTextField)
    finalW := strint (final)
    GUI.SetSelection (FinalSATextField, -1, -1)
    GUI.SetActive (FinalSATextField)
end FinalCWEntered

procedure KnowledgeSAEntered (text : string)
end KnowledgeSAEntered

procedure ThinkingSAEntered (text : string)
end ThinkingSAEntered

procedure CommunicationSAEntered (text : string)
end CommunicationSAEntered

procedure ApplicationSAEntered (text : string)
end ApplicationSAEntered

procedure FinalSAEntered (text : string)
    GUI.SetSelection (FinalSATextField, -1, -1)
    GUI.SetActive (FinalSATextField)
    assignmentFinal := GUI.GetText (FinalSATextField)
    assignmentFinalSA := strint (assignmentFinal)
    DrawPieChart
    GUI.SetSliderValue (scrollBar, currentAssignment + 1)
    % GUI.SetSliderValue calls ChooseAssignment automatically
end FinalSAEntered

% Output the caluclated marks of knowledge, thinking, communication, appilcation in the final mark report.
procedure output
    var GraphKL : int := GUI.CreateLabel (40, 125, "Knowledge")
    var GraphTL : int := GUI.CreateLabel (40, 100, "Thinking")
    var GraphCL : int := GUI.CreateLabel (40, 75, "Communication")
    var GraphAL : int := GUI.CreateLabel (40, 50, "Application")
    var GraphFL : int := GUI.CreateLabel (40, 25, "Final")
    var CategoryL : int := GUI.CreateLabel (40, 150, "Category")
    var CourseWeightingL : int := GUI.CreateLabel (148, 150, "Course Weighting")
    var StudentAchievementL : int := GUI.CreateLabel (268, 150, "Student Achievement")
    var percentage1 : int := GUI.CreateLabel (236, 125, "%")
    KnowledgeCWTextField := GUI.CreateTextFieldFull (148, 125, 80, "", KnowledgeCWEntered, GUI.INDENT, 0, 0)
    var percentage2 : int := GUI.CreateLabel (236, 100, "%")
    ThinkingCWTextField := GUI.CreateTextFieldFull (148, 100, 80, "", ThinkingCWEntered, GUI.INDENT, 0, 0)
    var percentage3 : int := GUI.CreateLabel (236, 75, "%")
    CommunicationCWTextField := GUI.CreateTextFieldFull (148, 75, 80, "", CommunicationCWEntered, GUI.INDENT, 0, 0)
    var percentage4 : int := GUI.CreateLabel (236, 50, "%")
    ApplicationCWTextField := GUI.CreateTextFieldFull (148, 50, 80, "", ApplicationCWEntered, GUI.INDENT, 0, 0)
    var percentage5 : int := GUI.CreateLabel (236, 25, "%")
    FinalCWTextField := GUI.CreateTextFieldFull (148, 25, 80, "", FinalCWEntered, GUI.INDENT, 0, 0)
    var percentage6 : int := GUI.CreateLabel (366, 125, "%")
    KnowledgeSATextField := GUI.CreateTextFieldFull (268, 125, 88, "", KnowledgeSAEntered, GUI.INDENT, 0, 0)
    var percentage7 : int := GUI.CreateLabel (366, 100, "%")
    ThinkingSATextField := GUI.CreateTextFieldFull (268, 100, 88, "", ThinkingSAEntered, GUI.INDENT, 0, 0)
    var percentage8 : int := GUI.CreateLabel (366, 75, "%")
    CommunicationSATextField := GUI.CreateTextFieldFull (268, 75, 88, "", CommunicationSAEntered, GUI.INDENT, 0, 0)
    var percentage9 : int := GUI.CreateLabel (366, 50, "%")
    ApplicationSATextField := GUI.CreateTextFieldFull (268, 50, 88, "", ApplicationSAEntered, GUI.INDENT, 0, 0)
    var percentage10 : int := GUI.CreateLabel (366, 25, "%")
    FinalSATextField := GUI.CreateTextFieldFull (268, 25, 88, "", FinalSAEntered, GUI.INDENT, 0, 0)

    % Set the selections to cover all the text in each of the text fields
    GUI.SetSelection (KnowledgeCWTextField, -1, -1)
    % Make the name field the active text field
    GUI.SetActive (KnowledgeCWTextField)
    GUI.SetSelection (ThinkingCWTextField, -1, -1)
    GUI.SetSelection (CommunicationCWTextField, -1, -1)
    GUI.SetSelection (ApplicationCWTextField, -1, -1)
    GUI.SetSelection (FinalCWTextField, -1, -1)
    GUI.SetSelection (FinalSATextField, -1, -1)

    assignmentKnowledgeSA := round (SumKnowledge / SumKnowledgeW)
    assignmentThinkingSA := round (SumThinking / SumThinkingW)
    assignmentCommunicationSA := round (SumCommunication / SumCommunicationW)
    assignmentApplicationSA := round (SumApplication / SumApplicationW)
    knowledge := realstr (assignmentKnowledgeSA, 1)
    thinking := realstr (assignmentThinkingSA, 1)
    communication := realstr (assignmentCommunicationSA, 1)
    application := realstr (assignmentApplicationSA, 1)
    GUI.SetText (KnowledgeSATextField, knowledge)
    GUI.SetText (ThinkingSATextField, thinking)
    GUI.SetText (CommunicationSATextField, communication)
    GUI.SetText (ApplicationSATextField, application)
end output

% The procedure of collecting datas.
procedure ChooseAssignment (assignmentNumber : int)
    data (currentAssignment).knowledge := GUI.GetText (KnowledgeTextField)
    data (currentAssignment).knowledgeW := GUI.GetText (KnowledgeWTextField)
    data (currentAssignment).thinking := GUI.GetText (ThinkingTextField)
    data (currentAssignment).thinkingW := GUI.GetText (ThinkingWTextField)
    data (currentAssignment).communication := GUI.GetText (CommunicationTextField)
    data (currentAssignment).communicationW := GUI.GetText (CommunicationWTextField)
    data (currentAssignment).application := GUI.GetText (ApplicationTextField)
    data (currentAssignment).applicationW := GUI.GetText (ApplicationWTextField)

    % Place the new current record in the text fields
    currentAssignment := assignmentNumber

    if assignmentNumber > AssignmentNum then
	output
    else
	GUI.SetText (KnowledgeTextField, data (currentAssignment).knowledge)
	GUI.SetText (KnowledgeWTextField, data (currentAssignment).knowledgeW)
	GUI.SetText (ThinkingTextField, data (currentAssignment).thinking)
	GUI.SetText (ThinkingWTextField, data (currentAssignment).thinkingW)
	GUI.SetText (CommunicationTextField, data (currentAssignment).communication)
	GUI.SetText (CommunicationWTextField, data (currentAssignment).communicationW)
	GUI.SetText (ApplicationTextField, data (currentAssignment).application)
	GUI.SetText (ApplicationWTextField, data (currentAssignment).applicationW)

	% Set the label to indicate the current record
	GUI.SetLabel (AssignmentLabel, "Assignment " + intstr (assignmentNumber) + " of " +
	    intstr (numAssignments))

	% Set the selections to cover all the text in each of the text fields
	GUI.SetSelection (KnowledgeTextField, -1, -1)
	% Make the name field the active text field
	GUI.SetActive (KnowledgeTextField)
	GUI.SetSelection (KnowledgeWTextField, -1, -1)
	GUI.SetSelection (ThinkingTextField, -1, -1)
	GUI.SetSelection (ThinkingWTextField, -1, -1)
	GUI.SetSelection (CommunicationTextField, -1, -1)
	GUI.SetSelection (CommunicationWTextField, -1, -1)
	GUI.SetSelection (ApplicationTextField, -1, -1)
	GUI.SetSelection (ApplicationWTextField, -1, -1)
    end if
end ChooseAssignment

% Subproceudure of output. They are used for accumulating datas and move the cusor to next textfield.
procedure AddAssignment
    numAssignments += 1
    GUI.SetSliderMinMax (scrollBar, 1, numAssignments)
    % GUI.SetSliderValue calls ChooseAssignment automatically
    GUI.SetSliderValue (scrollBar, numAssignments)
end AddAssignment


procedure KnowledgeEntered (text : string)
    temp := GUI.GetText (KnowledgeTextField)
    calculate (currentAssignment).knowledge := strint (temp)
    GUI.SetSelection (KnowledgeWTextField, -1, -1)
    GUI.SetActive (KnowledgeWTextField)
end KnowledgeEntered

procedure KnowledgeWEntered (text : string)
    temp := GUI.GetText (KnowledgeWTextField)
    calculate (currentAssignment).knowledgeW := strint (temp)
    SumKnowledge += (calculate (currentAssignment).knowledge * calculate (currentAssignment).knowledgeW)
    SumKnowledgeW += calculate (currentAssignment).knowledgeW
    GUI.SetSelection (ThinkingTextField, -1, -1)
    GUI.SetActive (ThinkingTextField)
end KnowledgeWEntered

procedure ThinkingEntered (text : string)
    temp := GUI.GetText (ThinkingTextField)
    calculate (currentAssignment).thinking := strint (temp)
    GUI.SetSelection (ThinkingWTextField, -1, -1)
    GUI.SetActive (ThinkingWTextField)
end ThinkingEntered

procedure ThinkingWEntered (text : string)
    temp := GUI.GetText (ThinkingWTextField)
    calculate (currentAssignment).thinkingW := strint (temp)
    SumThinking += (calculate (currentAssignment).thinking * calculate (currentAssignment).thinkingW)
    SumThinkingW += calculate (currentAssignment).thinkingW
    GUI.SetSelection (CommunicationTextField, -1, -1)
    GUI.SetActive (CommunicationTextField)
end ThinkingWEntered

procedure CommunicationEntered (text : string)
    temp := GUI.GetText (CommunicationTextField)
    calculate (currentAssignment).communication := strint (temp)
    GUI.SetSelection (CommunicationWTextField, -1, -1)
    GUI.SetActive (CommunicationWTextField)
end CommunicationEntered

procedure CommunicationWEntered (text : string)
    temp := GUI.GetText (CommunicationWTextField)
    calculate (currentAssignment).communicationW := strint (temp)
    SumCommunication += (calculate (currentAssignment).communication * calculate (currentAssignment).communicationW)
    SumCommunicationW += calculate (currentAssignment).communicationW
    GUI.SetSelection (ApplicationTextField, -1, -1)
    GUI.SetActive (ApplicationTextField)
end CommunicationWEntered

procedure ApplicationEntered (text : string)
    temp := GUI.GetText (ApplicationTextField)
    calculate (currentAssignment).application := strint (temp)
    GUI.SetSelection (ApplicationWTextField, -1, -1)
    GUI.SetActive (ApplicationWTextField)
end ApplicationEntered

procedure ApplicationWEntered (text : string)
    temp := GUI.GetText (ApplicationWTextField)
    calculate (currentAssignment).applicationW := strint (temp)
    SumApplication += (calculate (currentAssignment).application * calculate (currentAssignment).applicationW)
    SumApplicationW += calculate (currentAssignment).applicationW

    if currentAssignment = numAssignments then
	AddAssignment
    else
	GUI.SetSliderValue (scrollBar, currentAssignment + 1)
	% GUI.SetSliderValue calls ChooseAssignment automatically
    end if
end ApplicationWEntered

%Main Program
GUI.SetBackgroundColour (grey)
AssignmentLabel := GUI.CreateLabelFull (284, 400, "Assignment 1 of 1", 100, 0, GUI.CENTER, 0)
KnowledgeTextField := GUI.CreateTextFieldFull (40, 345, 122, "", KnowledgeEntered, GUI.INDENT, 0, 0)
var KL : int := GUI.CreateLabel (40, 370, "Knowledge (yellow)")
KnowledgeWTextField := GUI.CreateTextFieldFull (96, 320, 66, "", KnowledgeWEntered, GUI.INDENT, 0, 0)
var KWL : int := GUI.CreateLabel (40, 320, "Weight")
ThinkingTextField := GUI.CreateTextFieldFull (186, 345, 122, "", ThinkingEntered, GUI.INDENT, 0, 0)
var TL : int := GUI.CreateLabel (186, 370, "Thinking (green)")
ThinkingWTextField := GUI.CreateTextFieldFull (242, 320, 66, "", ThinkingWEntered, GUI.INDENT, 0, 0)
var TWL : int := GUI.CreateLabel (186, 320, "Weight")
CommunicationTextField := GUI.CreateTextFieldFull (332, 345, 122, "", CommunicationEntered, GUI.INDENT, 0, 0)
var CL : int := GUI.CreateLabel (332, 370, "Communication (blue)")
CommunicationWTextField := GUI.CreateTextFieldFull (388, 320, 66, "", CommunicationWEntered, GUI.INDENT, 0, 0)
var CWL : int := GUI.CreateLabel (332, 320, "Weight")
ApplicationTextField := GUI.CreateTextFieldFull (478, 345, 122, "", ApplicationEntered, GUI.INDENT, 0, 0)
var AL : int := GUI.CreateLabel (478, 370, "Application (orange)")
ApplicationWTextField := GUI.CreateTextFieldFull (534, 320, 66, "", ApplicationWEntered, GUI.INDENT, 0, 0)
var AWL : int := GUI.CreateLabel (478, 320, "Weight")

var addAssignment := GUI.CreateButton (40, 285, 100, "Add Assignment", AddAssignment)

scrollBar := GUI.CreateVerticalScrollBarFull (610, 240, 200, 1, 1, 1,
    ChooseAssignment, 1, 5, 0)

GUI.SetSliderReverse (scrollBar)

loop
    exit when GUI.ProcessEvent
end loop


