VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "TestClassLister"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public Function TestClasses() As Collection
    Dim Components As VBComponents, component As VBComponent
    Set TestClasses = New Collection
    Set Components = Application.VBE.ActiveVBProject.VBComponents
    For Each component In Components
        If IsClassModule(component.Type) And IsTestClassName(component.name) Then
            TestClasses.Add component.name
        End If
    Next
End Function

Public Function IsTestClassName(ComponentName As String) As Boolean
    If Len(ComponentName) <= 6 Then Exit Function
    IsTestClassName = Right(ComponentName, 6) Like "Tester"
End Function

Public Function IsClassModule(ComponentType As vbext_ComponentType) As Boolean
    IsClassModule = (ComponentType = vbext_ct_ClassModule)
End Function

Public Function NewTestClass(TestClassName As String) As ITest
    Dim test As ITest
    Set NewTestClass = SelectTestClass(TestClassName)
    If NewTestClass Is Nothing Then Exit Function
    NewTestClass.Manager.ClassName = TestClassName
End Function

Public Function SelectTestClass(TestClassName As String) As ITest
    Select Case TestClassName
        Case "vtkCreateProjectTester": Set SelectTestClass = New vtkCreateProjectTester
        Case "vtkPathUtilitiesTester": Set SelectTestClass = New vtkPathUtilitiesTester
        Case "vtkWorkbookIsOpenTester": Set SelectTestClass = New vtkWorkbookIsOpenTester
        Case "vtkConfManagerExcel10Tester": Set SelectTestClass = New vtkConfManagerExcel10Tester
        Case "vtkConfManagerExcel11Tester": Set SelectTestClass = New vtkConfManagerExcel11Tester
        Case "vtkConfManagerExcel12Tester": Set SelectTestClass = New vtkConfManagerExcel12Tester
        Case "vtkConfigurationManagersTester": Set SelectTestClass = New vtkConfigurationManagersTester
        Case "vtkProjectsTester": Set SelectTestClass = New vtkProjectsTester
        Case "vtkProjectTester": Set SelectTestClass = New vtkProjectTester
        Case "vtkInitializeVbaUnitTester": Set SelectTestClass = New vtkInitializeVbaUnitTester
        Case "vtkCreateTreeFolderTester": Set SelectTestClass = New vtkCreateTreeFolderTester
        Case "vtkImportExportUtilitiesTester": Set SelectTestClass = New vtkImportExportUtilitiesTester
        Case "vtkToolBarsTester": Set SelectTestClass = New vtkToolBarsTester
        Case "vtkExportOneModuleTester": Set SelectTestClass = New vtkExportOneModuleTester
        Case "vtkGitFunctionsTester": Set SelectTestClass = New vtkGitFunctionsTester
        Case "vtkFileSystemUtilitiesTester": Set SelectTestClass = New vtkFileSystemUtilitiesTester
        Case "vtkConfigurationTester": Set SelectTestClass = New vtkConfigurationTester
        Case "vtkModuleTester": Set SelectTestClass = New vtkModuleTester
        Case "vtkExportConfigurationTester": Set SelectTestClass = New vtkExportConfigurationTester
        Case "vtkNormalizeTester": Set SelectTestClass = New vtkNormalizeTester
        Case "vtkTestUtilitiesTester": Set SelectTestClass = New vtkTestUtilitiesTester
        Case "vtkXMLExportTester": Set SelectTestClass = New vtkXMLExportTester
        Case "vtkRecreateConfExcelTester": Set SelectTestClass = New vtkRecreateConfExcelTester
        Case "vtkExcelUtilitiesTester": Set SelectTestClass = New vtkExcelUtilitiesTester
        Case "vtkReferenceManagerTester": Set SelectTestClass = New vtkReferenceManagerTester
        Case "vtkConfManagerXML20Tester": Set SelectTestClass = New vtkConfManagerXML20Tester
        Case "vtkRecreateConfXMLTester": Set SelectTestClass = New vtkRecreateConfXMLTester
        Case Else:
    End Select
End Function
