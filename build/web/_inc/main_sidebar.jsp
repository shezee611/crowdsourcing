<%@page import="java.util.ArrayList"%>
<aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="dist/img/<%=(String) session.getAttribute("sess_photo")%>" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p><%=(String) session.getAttribute("sess_username")%></p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
           <% // page import="INSE6260.CategoryClass" %>
         
		   <%	/*	   
		   	   CategoryClass obj= new CategoryClass();
		   
		   
               CategoryClass temp;
               ArrayList<CategoryClass> al = obj.select("");               
              // out.println("<li>size: "+al.size()+"</li>");
               if(al.size()>0){
				   for (int i = 0; i < al.size(); i++) {
					temp = new CategoryClass();
					 temp  = al.get(i);
				   
			  out.println("<li><a href='tasks.jsp?cat="+temp.getId()+"'><i class='fa "+temp.getClassName()+"'></i> <span>"+temp.getName()+"</span> <small class='label pull-right bg-green'>new</small></a></li>");
				   }
               }
		   */
		   %>
             <li><hr /></li>   
             <% if(session.getAttribute("sess_user_type").toString().equals("2")){ %>
              <li class="treeview">
              <a href="#">
                <i class="fa fa-list-ol"></i> <span>Expertise</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
              
                <li><a href="expertise.jsp"><i class="fa fa-circle-o"></i> My Expertise</a></li>
                <li class="active"><a href="add-expertise.jsp"><i class="fa fa-circle-o"></i> Add Expertise</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-tasks"></i> <span>Tasks</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="assignedtasks.jsp"><i class="fa fa-circle-o"></i> Assigned</a></li>
                <li class="active"><a href="myinvitations.jsp"><i class="fa fa-circle-o"></i> Invitations</a></li>
                 <li class="active"><a href="taskslist.jsp"><i class="fa fa-circle-o"></i> Task History</a></li>                
              </ul>
            </li>
            
             <% } else if(session.getAttribute("sess_user_type").toString().equals("1")){%>             
             
               <li class="treeview">
              <a href="#">
                <i class="fa fa-tasks"></i> <span>Tasks</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="addtasks.jsp"><i class="fa fa-circle-o"></i> Add New Task</a></li>
                <li class="active"><a href="taskdescription.jsp"><i class="fa fa-circle-o"></i> Current Task</a></li>
                <li class="active"><a href="taskslist.jsp"><i class="fa fa-circle-o"></i> Task History</a></li>
                
              </ul>
            </li>
            
            
             <% } %>      
            <li><a href="viewmessage.jsp?id=0"><i class="fa fa-inbox"></i>View Messages</a></li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>