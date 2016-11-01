<%@ page language="java" errorPage="/sample/common/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/top.jsp"%>
		<div class="location"><a href="<c:url value='/anyframe.jsp'/>">Home</a> &gt; <a href="<c:url value='/fileUploadMovieFinder.do?method=list'/>">FileUpload 1.0.2</a></div>
    </div>
    <hr />
<script type="text/javascript" src="<c:url value='/sample/javascript/InputCalendar.js'/>"></script>
<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>   
<script type="text/javascript">
	function fncCreateMovie() {
	    document.movieForm.action="<c:url value='/fileUploadMovie.do?method=create'/>";
	    document.movieForm.submit();
	}
	
	function fncUpdateMovie() {
	    document.movieForm.action="<c:url value='/fileUploadMovie.do?method=update'/>";
	    document.movieForm.submit();
	}
	
	function fncRemoveMovie(){	
		if(confirmDelete('movie')) {
		    document.movieForm.action="<c:url value='/fileUploadMovie.do?method=remove'/>";
		    document.movieForm.submit();
		}	    
	}
	
	var gFiles = 0;
	function addFile() {
		var tr = document.createElement('tr');
		tr.setAttribute('id', 'file-' + gFiles);
		var td = document.createElement('td');
		//var removeFileId = "file"+gFiles
		td.innerHTML = '<input type="file" name="file"/><span onclick="removeFile(\'file-' + gFiles + '\')" style="cursor:pointer;">Delete</span>'
		tr.appendChild(td);
		document.getElementById('files-root').appendChild(tr);
		gFiles++;
	}
	function removeFile(aId) {
		var obj = document.getElementById(aId);
		if(obj == null){
			alert("parent Node is null");
		}
		else
			obj.parentNode.removeChild(obj);
	}	
</script>    
    <div id="container">
    	<div class="cont_top">
        	<h2>
        		<c:if test="${empty movie.movieId}">
				 	<spring:message code='movie.add'/>
				 	<c:set var="readonly" value="false"/>
				</c:if>
			
				<c:if test="${not empty movie.movieId}">	
					<spring:message code='movie.update'/>
					<c:set var="readonly" value="true"/>				 
				</c:if>
			</h2>
        </div>
        <div class="view">
        <form:form modelAttribute="movie" name="movieForm" method="post" enctype="multipart/form-data">
        <c:if test="${not empty movie.movieId}">
			<form:hidden path="movieId" />
		</c:if>
      		<table summary="This table shows detail information about genre, title, director, actors, runtime, release date, ticket price of the movie">
            	<caption>Detail information</caption>
                <colgroup>
                	<col style="width:20%;" />
                    <col style="width:80%;" />
                </colgroup>
                <tbody>
                	<tr>
                    	<th><label for="title"><spring:message code="movie.title" />&nbsp;*</label></th>
                        <td><form:input path="title" cssClass="w_normal" /><form:errors path="title" cssClass="errors" /></td>
                    </tr>
                    <tr>
                    	<th><label for="director"><spring:message code="movie.director" />&nbsp;*</label></th>
                        <td><form:input path="director" cssClass="w_normal" /><form:errors path="director" cssClass="errors" /></td>
                    </tr>
                    <tr>
                    	<th><label for="genre"><spring:message code="movie.genre" />&nbsp;*</label></th>
                        <td>
                        	<form:select id="genre" path="genre.genreId">
            					<form:options items="${genreList}" itemValue="genreId" itemLabel="name"/>
				          	</form:select>
          				</td>
                    </tr>
                    <tr>
                    	<th><label for="actors"><spring:message code="movie.actors" />&nbsp;*</label></th>
                        <td><form:input path="actors" cssClass="w_normal" /><form:errors path="actors" cssClass="errors" /></td>
                    </tr>
                    <tr>
                    	<th><label for="runtime"><spring:message code="movie.runtime" /></label></th>
                        <td><form:input path="runtime" cssClass="w_time" />min.<form:errors path="runtime" cssClass="errors" /></td>
                    </tr>
                    <tr>
                    	<th><label for="releaseDate"><spring:message code="movie.releaseDate" /></label></th>
                        <td>
                        <span class="float_left margin_right5"><form:input path="releaseDate" cssClass="w_date"  maxlength="10" /></span>
                        <label for="calendar" class="float_left">
                        <a href="javascript:popUpCalendar(document.movieForm.releaseDate, 'yyyy-mm-dd');">
                        	<img id="calendar" src="<c:url value='sample/images/btn_calendar_i.gif'/>" alt="Calendar" />
                        </a>	
                        </label></td>
                    </tr>
                    <tr>
                    	<th><label for="ticketPrice"><spring:message code="movie.ticketPrice" /></label></th>
                        <td><form:input path="ticketPrice" cssClass="w_price" /><form:errors path="ticketPrice" cssClass="errors" /></td>
                    </tr>
                    <tr>
                    	<th><label for="nowPlaying"><spring:message code="movie.nowPlaying" /></label></th>
                        <td><span class="float_left"><spring:message code="movie.isNowPlaying" /></span>
                        <span class="float_left margin_left5"><form:checkbox id="nowPlaying" path="nowPlaying" value="Y" /></span></td>
                    </tr>
                    <tr>
                    	<th><label for="referenceFiles"><spring:message code="movie.referenceFiles" /></label></th>
                        <td>
                        	<c:if test="${not empty movie.fileRefId}">
								<form:hidden path="fileRefId"/>
								<c:forEach var="attachedFile" items = "${attachedFiles}">
									<a href="<c:url value='/fileDownload.do?id=${attachedFile.id}&name=${attachedFile.name}&fileSize=${attachedFile.fileSize}'/>">${attachedFile.name}</a>  (${attachedFile.fileSize} Byte)<br/>
								</c:forEach>
							</c:if>
							<c:if test="${empty movie.fileRefId && not empty movie.movieId}">
								<spring:message code="file.empty"/>
							</c:if>
							<c:if test="${empty movie.movieId}">
								<table><tbody id="files-root">
									<tr><td><input type="file" name="file"/><span onclick="addFile()" style="cursor:pointer;">Add File</span></td></tr>
								</table>
							</c:if>	
                        </td>
                    </tr>
                </tbody>
            </table>
            </form:form>
        </div>
        <div class="btncontainer_center">
		    <a href="<c:url value='fileUploadMovieFinder.do?method=list'/>">
		    <span class="button default icon">
		        <span class="list">&nbsp;</span>
		        <span class="none_a txt_num4"><spring:message code="movie.button.list" /></span>
		    </span>
		    </a>           
	        <c:if test="${empty movie.movieId}">
			    <a href="javascript:fncCreateMovie();">
			    <span class="button default icon">
			        <span class="add">&nbsp;</span>
			        <span class="none_a txt_num3"><spring:message code="movie.button.add" /></span>
			    </span>
			    </a>   	        
	        </c:if>
	        <c:if test="${not empty movie.movieId}">
			    <a href="javascript:fncUpdateMovie();">
			    <span class="button default icon">
			        <span class="update">&nbsp;</span>
			        <span class="none_a txt_num6"><spring:message code="movie.button.update" /></span>
			    </span>
			    </a> 
			    <a href="javascript:fncRemoveMovie();">
			    <span class="button default icon">
			        <span class="delete">&nbsp;</span>
			        <span class="none_a txt_num6"><spring:message code="movie.button.remove" /></span>
			    </span>
			    </a> 		        
	        </c:if>
    	</div>
	</div>
    <hr />
<%@ include file="/sample/common/bottom.jsp"%>