<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyUserControl.ascx.cs" Inherits="CollegeManegmentSystem.MyUserControl" %>
    <nav class="navbar navbar-light navbar-expand-md bg-info shadow fixed-top ">
        <span class="navbar-brand text-light">College Menegment System</span>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
             <span class="navbar-toggler-icon"></span>
             </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
           <ul class="navbar-nav mr-auto">
                 <li class="nav-item active">
                        <a class="nav-link" href="ClassRoom.aspx">Class Type</a>
                 </li>
                 <li class="nav-item">
                    <a class="nav-link" href="StudentClassInfo.aspx">Class Rooms</a>
                </li>
              
                 <li class="nav-item">
                      <a class="nav-link " href="ClassInformation.aspx">Class Aveilavale</a>
                 </li>
                <li class="nav-item">
                      <a class="nav-link " href="Class_Report.aspx">Report</a>
                 </li>
              </ul>
   
            </div>
        </nav>