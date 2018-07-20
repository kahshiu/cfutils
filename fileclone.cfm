<cfset parking= "./parkingbay/">
<cfset target="2018JUN12_parts_1.sql">

<cffunction access="public" name="namingConvention" returntype="string" output=false description="">
    <cfargument name="textappend" type="string" required="false" default="">
    <cfargument name="count" type="numeric" required="false" default="">
    <cfargument name="ext" type="string" required="false" default="sql">

    <cfset var t = now()>
    <cfset var name = dateformat(now(),"yyyymmdd")>

    <cfif len(arguments.textappend) gt 0> <cfset name = listAppend(name,arguments.textappend,"_")> </cfif>
    <cfif len(arguments.count) gt 0>      <cfset name = listAppend(name,arguments.count     ,"_")> </cfif>
    <cfif len(arguments.ext  ) gt 0>      <cfset name = listAppend(name,arguments.ext       ,".")> </cfif>

    <cfreturn name>
</cffunction>

<cfset sos = expandpath(parking&target)>
<cffile action="read" file=#sos# variable="content">

<cfset cdate = createdate(2017,2,1)>
<cfset mminterval = 1>
<cfset mmcounts = 12>

<cfloop index="i" from="0" to=#mmcounts# step="1">
    <cfset temp = content>
    <cfset temp = replace(temp,"{date}",dateFormat(dateAdd("m",i*mminterval,cdate),"yyyy-mm-dd"))>
    <cfset temp = replace(temp,"{mmcount}",1)>

    <cfset target = expandpath(parking&namingConvention("parts",i))>
    <cfset filewrite(target,temp)>
</cfloop>

<!--- 
<cffile action="copy" source=#sos# destination=#target#>
 --->
