<c:if test="${!empty(message)}">
<div class="row center-text">
<span class="message">
message: ${message}
</span>
</div>

</c:if>
<c:if test="${!empty(errorMessage)}">
<div class="row center-text">
<span class="errorMessage">
error message: ${errorMessage}
</span>
</div>

</c:if>
