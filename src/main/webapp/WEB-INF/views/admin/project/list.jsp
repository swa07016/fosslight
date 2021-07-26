<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/constants.jsp"%>
<!-- wrap -->
<div id="wrapIframe">
	<!---->
	<div>
		<!---->
		<fieldset class="listSearch">
			<form id="projectSearch" name="projectSearch">
				<dl class="basicSearch col3">
					<dt>Basic Search Area</dt>
					<dd>
						<label>ID</label>
						<input type="text" name="prjId" value="${searchBean.prjId}"/>
					</dd>
					<dd class="centerAign">
						<label>Project Name</label>
						<input type="text" name="prjName" class="autoComProjectNm" value="${searchBean.prjName}"/>
					</dd>
					<dd class="lastAign">
						<label>Created Date</label>
						<input name="schStartDate" id="schStartDate" type="text" class="cal" title="Search Start Date" value="${searchBean.schStartDate}" maxlength="8" style="width:77px;"/> ~ 
						<input name="schEndDate" id="schEndDate" type="text" class="cal" title="Search End Date" value="${searchBean.schEndDate}" maxlength="8" style="width:77px;"/> 
					</dd>
					<dd>
						<label>Division</label>
						<span class="selectSet">
							<strong title="Status selected value"></strong>
							<select name="prjDivision">
								<option value=""></option>
								${ct:genOption(ct:getConstDef("CD_USER_DIVISION"))}
							</select>
						</span>						
					</dd>
					<dd class="centerAign">
						<label>Creator</label>
						<input type="text" name="creator" class="autoComCreatorDivision" value="${searchBean.creator}"/>
					</dd>
					<dd class="lastAign">
						<label>Reviewer</label>
						<input type="text" name="reviewer" class="autoComReviewer" value="${searchBean.reviewer}"/>
					</dd>
					<dd>
						<label>Distribution Type</label>
						<span class="selectSet overHidden">
							<strong title="Distribution type selected value"></strong>
							<select name="distributionType">
								<option value=""></option>
								${ct:genOption(ct:getConstDef("CD_DISTRIBUTION_TYPE"))}
							</select>
						</span>
					</dd>
					<dd class="centerAign">
						<label>Network Service</label>
						<span class="selectSet overHidden vmiddle">
							<strong title="Network servvice Type selected value"></strong>
							<select name="networkServerType">
								<option value=""></option>
								<option value="Y">Yes</option>
								<option value="N">No</option>
							</select>
						</span>
					</dd>
					<dd class="lastAign">
						<label>Model Name</label>
						<input type="text" name="modelName" class="autoComProjectModel" value="${searchBean.modelName}"/>
					</dd>
					<dd style="width:100%;">
						<label>Status</label>
						<span class='checkSet'>
						${ct:genCheckbox(ct:getConstDef("CD_PROJECT_STATUS"), searchBean.statuses, '')}
            			</span>
					</dd>
					<dd>
						<label>Priority</label>
						<span class="selectSet overHidden vmiddle">
							<strong title="Network servvice Type selected value"></strong>
							<select name="priority">
								<option value=""></option>
								${ct:genOption(ct:getConstDef("CD_PROJECT_PRIORITY"))}
							</select>
						</span>
					</dd>
					<c:if test="${!ct:isAdmin()}">
					<dd class="centerAign">
						<label class="vmiddle">View My Projects Only</label>
						<input type="checkbox" id="checkbox3" name="publicYn" checked="checked"/>
					</dd>
					</c:if>
				</dl>
				<input type="button" value="Admin Expand apply" class="btnHiddenExpand" />
				<dl class="hiddenSearch" style="display:none;">
					<dd>
						<label>OSS Name</label>
						<input type="text" name="ossName" class="autoComOss" value="${searchBean.ossName}"/>
					</dd>
					<dd class="centerAign">
						<label>OSS Version</label>
						<input type="text" name="ossVersion" class="autoComOssVersion" value="${searchBean.ossVersion}"/>
					</dd>
					<dd class="lastAign">
						<label>License Name</label>
						<input type="text" name="licenseName" class="autoComLicense" value="${searchBean.licenseName}"/>
					</dd>
					<dd>
						<label>Additional Information</label>
						<textarea name="comment" style="margin: 0px; width: 201px; height: 54px;">${searchBean.comment}</textarea>
					</dd>
					<dd class="centerAign w600">
						<label>Comment</label>
						<textarea name="userComment" style="margin: 0px; width: 180px; height: 54px;">${searchBean.userComment}</textarea>					
					</dd>
						<dd>
							<label>Binary Name</label>
							<input type="text" name="schBinaryName"  value="${searchBean.schBinaryName}"/>
						</dd>
					<c:if test="${partnerFlag}">
						<dd class="centerAign">
							<label>3rd party</label>
							<input type="text" name="refPartnerId" class="autoComConfParty" value="${searchBean.refPartnerId}"/>
						</dd>
					</c:if>
				</dl>
				<input name="act" type="hidden" value="search"/>
				<input id="search" type="submit" value="Search" class="btnColor search" />
				<a class="right" id="helpLink" style="position:absolute; cursor: pointer; top:10px; right:-60px; display:none;"><img alt="" src="/images/user-guide.png" /></a>
			</form>
		</fieldset>
		<!---->
		<div class="btnLayout">
			<input type="button" value="Reject" class="btnReject btnColor left" style="display: none;"/>
			
			<!-- Popup -->
			<div id="rejectPop" class="pop rejectPop">
				<h1>RequestUpdate</h1>
				<div class="popdata">
					<div class="radioSet"><input type="radio" id="r1" name="radioName" value="0"><label for="r1">Identification</label></div>
					<div class="radioSet mt10"><input type="radio" id="r2" name="radioName" value="1"><label for="r2">Verification</label></div>
					<div class="taSet required mt20">
						<label for="t1">Caused by</label>
						<textarea id="reason" rows="8"></textarea>
						<div class="retxt">This field is required.</div>
					</div>
				</div>
				<div class="pbtn">
					<input id="popCancel" type="button" value="Cancel" class="btnCancel btnColor" />
					<input id="popReject" type="button" value="Reject" class="btnColor red" />
				</div>
			</div>
			<!-- //Popup -->
			<span class="left">
				<input type="button" value="BOM Compare" class="btnColor blue w120" onclick="fn.bomCompare();" />
			</span>
			
			<span class="right">
				<a href="#none" class="btnSet excel" onclick="fn.downloadExcel()"><span>Excel download</span></a>
				<input type="button" value="Add" class="btnColor btnAdd" onclick="createTabInFrame('New_Project', '#/project/edit')" />
			</span>
		</div>
		<!---->
		<div class="jqGridSet">
			<table id="list"><tr><td></td></tr></table>
			<div id="pager"></div>
		</div>
		<!---->
		<div class="btnLayout">
			<span class="left">
				<input type="button" value="BOM Compare" class="btnColor blue w120" onclick="fn.bomCompare();" />
			</span>
		
			<input type="button" value="Reject" class="btnReject btnColor left" />
			<span class="right">
				<a href="#none" class="btnSet excel" onclick="fn.downloadExcel()"><span>Excel download</span></a>
				<input type="button" value="Add" class="btnColor btnAdd" onclick="createTabInFrame('New_Project', '#/project/edit')" />
			</span>
		</div>
		<!---->
	</div>
	<!---->
</div>
<!-- //wrap --> 