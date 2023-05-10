<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/student.css" />
<div id="student_editDiv">
	<form id="studentEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">学号:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="student_studentNumber_edit" name="student.studentNumber" value="<%=request.getParameter("studentNumber") %>" style="width:200px" />
			</span>
		</div>

		<div>
			<span class="label">登录密码:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="student_password_edit" name="student.password" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">所在班级:</span>
			<span class="inputControl">
				<input class="textbox"  id="student_classObj_classNumber_edit" name="student.classObj.classNumber" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">姓名:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="student_studentName_edit" name="student.studentName" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">性别:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="student_sex_edit" name="student.sex" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">出生日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="student_birthday_edit" name="student.birthday" />

			</span>

		</div>
		<div>
			<span class="label">学生照片:</span>
			<span class="inputControl">
				<img id="student_studentPhotoImg" width="200px" border="0px"/><br/>
    			<input type="hidden" id="student_studentPhoto" name="student.studentPhoto"/>
				<input id="studentPhotoFile" name="studentPhotoFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">联系电话:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="student_telephone_edit" name="student.telephone" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">邮箱:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="student_email_edit" name="student.email" style="width:200px" />

			</span>

		</div>
		<div class="operation">
			<a id="studentModifyButton" class="easyui-linkbutton">更新</a> 
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/Student/js/student_modify.js"></script> 
