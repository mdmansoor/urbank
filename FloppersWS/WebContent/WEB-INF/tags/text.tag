<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@attribute name="labelname" required="true" rtexprvalue="true"%>
<%@attribute name="name" required="true" rtexprvalue="true"%>
<%@attribute name="id" required="true" rtexprvalue="true"%>


<td><label>${labelname}</label></td>
<td><input type="text" name="${name}" id="${id}"></td>
<td><span id="${id}_error" class="level4_error"> <s:fielderror fieldName="%{name}">
			
		</s:fielderror></span></td>

