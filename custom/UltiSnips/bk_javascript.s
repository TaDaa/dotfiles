#;

#snippet "(?=;?!return[\s\t]*.*)" "end line" r
#snippet "(^((?!return)[\s\S;])*$)" "end line" r
#${1}
#endsnippet
#}
#snippet "^[\s\t]*\}$" "end line" r
#}
#${1}
#endsnippet
#snippet "\)$" "end line" r
#)
#${1}
#endsnippet


#DEFAULT
snippet "\bde\b|\bdef\b" "default..." r
default`!p
if t[1] and t[1][0] == ":":
	t[1]=t[1][1:len(t[1])]
	snip.swapped = True
	snip.rv = ":"
	snip >> 1
	snip += ""
elif not hasattr(snip,'swapped') and t[1] and t[1][0]:
	snip.rv = " "
`$1
endsnippet

#EXTEND
snippet "\bex\b" "extend" r
extends`!p
if t[1] and t[1][0] != " ":
	snip.rv += " "
`$1
endsnippet

#FROM
snippet "\bfr\b" "from" r
from`!p
if t[1] and t[1][0] != " ":
	snip.rv += " "
`$1
endsnippet

#IMPORT
snippet "\bim\b|\bimp\b" "import" r
import`!p
if t[1] and t[1][0] != " ":
	snip.rv += " "
`$1
endsnippet

#EXPORT
snippet "\bexp\b" "export" r
export`!p
if t[1] and t[1][0] != " ":
	snip.rv += " "
`$1
endsnippet

#CONST
snippet "\bco\b" "const" r
const`!p
if t[1] and t[1][0] != " ":
	snip.rv += " "
`$1
endsnippet

#CONST
snippet "\bl\b" "let" r
let`!p
if t[1] and t[1][0] != " ":
	snip.rv += " "
`$1;
endsnippet



#class block
snippet "\bcl\b|\bcls(\s\b){1,}" "cl" r
`!p
#if match.group(1) == ",":
	#snip.rv = " "
`class`!p
if t[1] and t[1][0] != " ":
	snip.rv += " "
`$1
endsnippet


snippet "\bnum\b" "number" r
number
endsnippet

#MODULE
snippet "\bmod\b" "module" r
module
endsnippet

#MODULE.EXPORTS
snippet "\bmodexp\b|\bmodexps\b" "module" r
module.exports
endsnippet

#EXPORTS
snippet "\breq\b" "exports" r
require($1)
endsnippet

#EXPORTS
snippet "\bexps\b" "exports" r
exports
endsnippet

snippet "\bsu\b" "super" r
super
endsnippet

snippet "\bsy\b" "Symbol" r
Symbol
endsnippet

#EXPORTS
snippet "\bfa\b" "arrow function" r
($1) => 
endsnippet

#EXPORTS
snippet "\bfao\b" "arrow function" r
($1) => {`!p
if (t[2] and t[2].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''`${2}`!p
if (t[2] and t[2].find('\n') != 0):
	snip += '}'
else:
	res = '}'`
endsnippet

snippet "\bfg\b" "function generator" r
function *$1 ($2) {`!p
if (t[3] and t[3].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''`${3}`!p
if (t[3] and t[3].find('\n') != 0):
	snip += '}'
else:
	res = '}'`
endsnippet

snippet "\bfcg\b" "function generator class" r
*$1 ($2) {`!p
if (t[3] and t[3].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''`${3}`!p
if (t[3] and t[3].find('\n') != 0):
	snip += '}'
else:
	res = '}'`
endsnippet
snippet "\bfc\b" "function class es6" r
$1 ($2) {`!p
if (t[3] and t[3].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''`${3}`!p
if (t[3] and t[3].find('\n') != 0):
	snip += '}'
else:
	res = '}'`
endsnippet

snippet "\bcons\b" "constructor" r
constructor ($1) {`!p
if (t[2] and t[2].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''`${2}`!p
if (t[2] and t[2].find('\n') != 0):
	snip += '}'
else:
	res = '}'`
endsnippet
#body result
#body
snippet "\bo\b" "body" r
{`!p
if (t[1] and t[1].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''`${1}`!p
if (t[1] and t[1].find('\n') != 0):
	snip += '}'
else:
	res = '}'`
endsnippet


snippet "\bio\b" "inline body" r
{$1}
endsnippet

#EXPORTS
snippet "\bke\b" "object key" r
'$1' : $2
endsnippet


#for of
snippet fo "for object" w
for (${1} of ${2}) {`!p
if (t[4] and t[4].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''`${4}`!p
if (t[4] and t[4].find('\n') != 0):
	snip += '}'
else:
	res = '}'`
endsnippet

#promise
snippet "\bpe\b" "promise" r
Promise
endsnippet

#then
snippet "\bthe\b" "then" r
then($1)
endsnippet

#then
snippet "\brej\b" "reject" r
reject($1)
endsnippet
#then
snippet "\bres\b" "resolve" r
resolve($1)
endsnippet
snippet "\bcat\b" "catch" r
catch($1)
endsnippet

#null
snippet "\b[,]{0,1}(nu)\b" "window" r
null
endsnippet
#anew
snippet "\b[,]{0,1}(an[e]{0,1}w)\b" "window" r
$1 = new 
endsnippet
#new
snippet "\b[,]{0,1}(nw)\b" "window" r
new 
endsnippet
#window
snippet "\b[,]{0,1}(win)\b" "window" r
window
endsnippet
#document
snippet "\b[,]{0,1}(doc)\b" "document" r
document
endsnippet

#removeEventListener
snippet "\.rel\b" "removeEventListener" r
.removeEventListener(${1})
endsnippet

#addEventListener
snippet "\.ael\b" "addEventListener" r
.addEventListener(${1})
endsnippet

#createElement
snippet "\bcel\b" "createElement" r
createElement(${1})
endsnippet

#querySelector
snippet "\bqs\b" "createElement" r
querySelector(${1})
endsnippet

#querySelectorAll
snippet "\bqsa\b" "createElement" r
querySelectorAll(${1})
endsnippet

#me
snippet "\bm\b|\bme\b" "me" r
me = this
endsnippet

#this
snippet "[^\,]{1}\bt\b|\bth\b" "this" r
this
endsnippet


#appendChild
snippet "\bac\b" "appendChild" r
appendChild(${1})
endsnippet

#document.createElement
snippet "\bdcel\b" "document.createElement" r
document.createElement('${1}')
endsnippet

#setAttribute
snippet "\bsta\b" "setAttribute" r
setAttribute('${2}','${3}')
endsnippet

#removeAttribute
snippet "\brma\b" "removeAttribute" r
removeAttribute('${2}')
endsnippet

#stProperty
snippet "\bstp\b" "setProperty" r
setProperty('${1}','${2}')
endsnippet

#removeProperty
snippet "\brmp\b" "removeProperty" r
removeProperty('${1}')
endsnippet

#removeProperty
snippet "\bto|typeof\b" "typeof" r
typeof ${1} === '${2}'
endsnippet

#style.propertyValue
snippet "\bspv\b" "style set property value" r
style.${1} = 
endsnippet

#style.setProperty
snippet "\bssp\b" "style.setProperty" r
style.setProperty('${1}','${2}')
endsnippet

#style.removeProperty
snippet "\bsrp\b" "style.removeProperty" r
style.removeProperty('${1}')
endsnippet




#and &&
snippet "\b[,]{0,1}aa\b" "and &&" r
&& 
endsnippet
#or ||
snippet "\b[,]{0,1}oo\b" "or ||" r
|| 
endsnippet
#p ()
snippet "\b[,]{0,1}pa\b" "parenthesis" r
(${1})
endsnippet

#pop ({})
snippet "\b[,]{0,1}pfa\b" "parenthesis with object" r
(($1) => $2)
endsnippet
#pop ({})
snippet "\b[,]{0,1}pfn\b" "parenthesis with object" r
(function${1/.+/ /}${1} (${2}) {`!p
if (t[3] and t[3].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''
`${3:}`!p
if (t[3] and t[3].find('\n') != 0):
	snip += '}'
else:
	res='}'
`)
endsnippet

#pop ({})
snippet "\b[,]{0,1}pop\b" "parenthesis with object" r
({
	${1} : ${2}
}${3})
endsnippet

#par ([])
snippet "\b[,]{0,1}par\b" "parenthesis with array" r
([${1}])
endsnippet


#ar []
snippet "\b[\,]{0,1}ar\b$" "array" r
[${1}]
endsnippet
#arop
snippet "\barop\b" "array containing object" r
[{
	${1} : ${2}
}]
endsnippet
#op {}
snippet "{}p|\bop\b" "object key" r
{
	${1} : ${2}
}
endsnippet
#snippet "([^\{o\}]{1})p\b" "property in object" r
#`!p
#res = match.group(1) if match.group(1) is not None else ''
#`'${1}' : ${2}
#endsnippet
snippet "(\{p)(})?" "object key" r
{
	${1} : ${2}
`!p
res = '\n}' if match.group(2) is not None else ''
`
endsnippet 
#,
snippet "(\:[^,]*)," "object key" r
`!p
snip.rv=match.group(0)
`
${1} : ${2}
endsnippet

#setget
snippet "\bsgc\b|\bsetgetc\b|\bgetsetc\b|\bgsc\b" "setter/getter" r
$1 (v) {
	if (arguments.length) {
		$2 = v; 
		return this;
	}
	return $2;
}
endsnippet
#setget
snippet "\bsg\b|\bsetget\b|\bgetset\b|\bgs\b" "setter/getter" r
function (v) {
	if (arguments.length) {
		$1 = v; 
		return this;
	}
	return $1;
}
endsnippet

#proto
snippet "\.pr\b" "prototype" r
.prototype
endsnippet

#forEach
snippet "\.fe\b" "forEach..." r
.forEach(${1})
endsnippet

#pop
snippet "\.po|\.p\b" "pop..." r
.pop()
endsnippet

#shift
snippet "\.sh\b" "shift..." r
.shift()
endsnippet

#unshift
snippet "\.us|\.ush\b" "unshift..." r
.unshift(${1})
endsnippet

#push
snippet "\.pu\b" "push..." r
.push(${1})
endsnippet

#map
snippet "\.ma\b" "map..." r
.map(${1})
endsnippet

#slice
snippet "\.sl\b" "slice..." r
.slice(${1})
endsnippet

#splice
snippet "\.sp\b" "splice..." r
.splice(${1})
endsnippet

#v
snippet "([^\(]{1})\bv|^v\b" "var" r
`!p
res = match.group(0) if match.group(0) is not None else ''
res += "ar"
` ${1};
endsnippet

#wh 
snippet wh "while" w
while (${1}) {`!p
if (t[2] and t[2].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''
`${2}`!p
if (t[2] and t[2].find('\n') != 0):
	snip += '}'
else:
	res = '}'
`
endsnippet

#try
snippet try "try...catch" w
try {
	${1}
} catch (${2:e}) {`!p
if (t[3] and t[3].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res=''
`${3}`!p
if (t[3] and t[3].find('\n') != 0):
	snip += '}'
else:
	res = '}'
`
endsnippet

#do
snippet dw "do while" w
do {`!p
if (t[1] and t[1].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res=""
`${1}`!p
if (t[1] and t[1].find('\n') != 0):
	snip += '}'
else:
	res="}"
` while (${2})
endsnippet
#fp
snippet fp "for property" w
for (${1} in ${2}) {`!p
if (t[4] and t[4].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''`${4}`!p
if (t[4] and t[4].find('\n') != 0):
	snip += '}'
else:
	res = '}'`
endsnippet
	
	#fl
snippet fl "for loop - no vars" w
for (${1};${2};${3}) {`!p
if (t[4] and t[4].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''`${4}`!p
if (t[4] and t[4].find('\n') != 0):
	snip += '}'
else:
	res = '}'`
endsnippet
#flu
snippet flu "for loop - increment up and cached length (incrementer then length then ln)" w
for (${1};${1/((var|let)[\s\t]*)|((=|,).*)//g}<${1/(.*,)|(=.*)|((var|let)[\s\t]*.*)//g)/};${1/((var|let)[\s\t]*)|((=|,).*)//g}++) {`!p
if (t[2] and t[2].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''`${2}`!p
if (t[2] and t[2].find('\n') != 0):
	snip += '}'
else:
	res = '}'`
endsnippet
#fld
snippet fld "for loop - increment down and cached length (decrementer, assume 0)" w
for (${1};${1/((var|let)[\s\t]*)|((=|,).*)//g}>=0;${1/((var|let)[\s\t]*)|((=|,).*)//g}--) {`!p
if (t[2] and t[2].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''`${2}`!p
if (t[2] and t[2].find('\n') != 0):
	snip += '}'
else:
	res = '}'`
endsnippet

#"alert
snippet al "alert" w
alert(${1});
endsnippet

#"console.log"
snippet cg "console.log" w
console.log(${1});
endsnippet

#"console.warn"
snippet cw "console.warn" w
console.warn(${1});
endsnippet

#"console.error"
snippet ce "console.error" w
console.error(${1});
endsnippet

#CLOSURE
snippet "\bcla\b" "closure..." r
(($1) => $2)($3)
endsnippet

#CLOSURE
snippet "\bclo|close|closure\b" "closure..." r
(function (${1}) `!p 
if (t[2] and t[2].find('\n') != 0):
	snip += '{'
	snip >> 1
	snip += ''
else:
	res = '{'
`${2}`!p
if (t[2]):
	snip >> 1
	snip += ''
else:	
	res = ' '
`return $3;`!p
if (t[3] != 'fn '):
	t[3] = t[3].strip()
if (t[2]):
	snip.rv += '\n'
	snip.rv += snip.mkline('')
else:	
	res = ''
`})(${4})
endsnippet
	
#SWITCH
snippet "\bsw|switch\b" "switch..." r
switch (${1}) {`!p
if (t[2] and t[2].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''
`${2:case }`!p
if ((t[2] != '' and t[2].find('\n') != 0) ):
	if (t[2] != 'case '):
		t[2] = t[2].strip()
	snip>> 1
	snip += ''
else:
	res = ''
`${3:default }`!p
if (t[3] != 'default '):
	t[3] = t[3].strip()
`
}
endsnippet

#STRING -single
snippet "(?<!')(?![.])+'p" "single quote" r
'+
'${1}'${2}
endsnippet
#STRING -single
snippet "''p\b" "single quote" r
'${1}'+
'${2}'
endsnippet
#STRING -double
snippet "(?<!\")(?![.])+\"p" "single quote" r
"+
"${1}"
endsnippet
#STRING -double
snippet "\"\"p\b" "double quote" r
"${1}"+
"${2}"
endsnippet

#CASE
snippet "\bcase\b" "case..." r
case ${1}:`!p
if (t[2]):
	snip >> 1
	snip += ''
`${2}`!p
if (t[2] == '' and t[3]):
	snip.rv += ' '
if (t[2] and t[3] and t[2].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''
`${3:break;}
endsnippet



#BREAK
snippet br "break;" w
break;
endsnippet

#CONTINUE
snippet "\bcon\b" "continue;" r
continue;
endsnippet

#RETURN
snippet "\bre|ret\b" "return" r
return${1/.+/ /}`!p
if (t[1] and t[2] and t[1].find(' ') != 0):
	snip >> 1
	snip += ' '
else:
	res = ''
`${1};
endsnippet				

#DELETE
snippet "\bdel\b" "delete" r
delete${1/.+/ /}${1:pointer};
endsnippet

#arguments
snippet "\ba|arg|args\b" "arguments" r
arguments
endsnippet
				
#FUNCTION
snippet "\bfn|fun\b" "function () {}" r
function${1/.+/ /}${1} (${2}) {`!p
if (t[3] and t[3].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''
`${3:}`!p
if (t[3] and t[3].find('\n') != 0):
	snip += '}'
else:
	res='}'
`
endsnippet


#IF
snippet "\bif\b" "if..." rA
if (${1}) {
	${2}
}${3/.+/ /}${3}
endsnippet

#ELSE IF
snippet "\bei|elseif\b" "else if..." rA
else if (${1}) {
	${2}
}${3/.+/ /}${3}
endsnippet

#ELSE
snippet "\bel\b|\belse\b" "else..." rA
else {
	${1}
}${2}
endsnippet

#setTimeout
snippet st "setTimeout..." w
setTimeout(${1})${2}
endsnippet

#setTimeoutClears
snippet stc "setTimeout Cleared..." w
${1:if ($2) {
	clearTimeout($2);
}}
${2} = setTimeout(function () {
	${2/var[\s\t\n]+//} = undefined;
	${3}
}${4})${5};${6}
endsnippet

snippet "\bu\b|\bun\b" "undefined" r
undefined
endsnippet

snippet "\b[,]{0,1}e\b" "assignment" r
= 
endsnippet
#e 

#n
snippet n "not" w
!
endsnippet

#se
snippet eee "Strict Equality..." w
=== 
endsnippet

#ee
snippet ee "Equality" w
== 
endsnippet

#nee
snippet nee "Strict not equals..." w
!== 
endsnippet

#ne
snippet ne "Not equals" w
!= 
endsnippet

#l 
snippet lt "less than" w
< 
endsnippet

#le 
snippet lte "less than equal" w
<= 
endsnippet

#g
snippet gt "greater than" w
> 
endsnippet

#ge
snippet gte "greater than equals" w
>= 
endsnippet


#
#
#
#Sencha Helpers
#
#
#

#edefine
snippet edef "Ext.define... " w
Ext.define('${1:`!p res = __import__('extpathloader').namify(path)`}',{
	'extend' : '${2:Ext.Base}'${3/.+/,
	/}${3:'requires' : [${4}]}${5/.+/,
	/}${5:'alternateClassName' : '${6}'}${7/.+/,
	/}${7:'statics' : {${8}}}${9/.+/,
	/}${9:'config' : {}}${10}${11/.+/,/}
	${11}
}${12/.+/,
/}${12});${13}
endsnippet

snippet emodel "Ext.define..." w
Ext.define('${1:`!p res = __import__('extpathloader').namify(path)`}',{
	'extend' : '${2:Ext.data.Model}'${3/.+/,
	/}${3:'requires' : [${4}]}${5/.+/,
	/}${5:'alternateClassName' : '${6}'}${7/.+/,
	/}${7:'statics' : {${8}}}${9/.+/,
	/}${9:'config' : {${10/.+/
		/}${10:'idProperty' : '${11}'}`!p res = ',' if (t[12] and t[10] or t[10] and t[14]) else ''`${12/.+/
		/}${12:'fields' : [${13}]}`!p res=',' if (t[12] and t[14]) else ''`${14/.+/
		/}${14:'proxy' : {${15}}} 
	}}${16/.+/,/}
	${16}
}${17/.+/,
/}${17});${18}
endsnippet
#econtroller
snippet econtroller "Ext.define... controller" w
Ext.define('${1:`!p res = __import__('extpathloader').namify(path)`}',{
	'extend' : '${2:Ext.app.Controller}'${3/.+/,
	/}${3:'requires' : [${4}]}${5/.+/,
	/}${5:'alternateClassName' : '${6}'}${7/.+/,
	/}${7:'statics' : {${8}}}${9/.+/,
	/}${9:'config' : {${10/.+/
		/}${10:'refs' : {${11}}}`!p res = ',' if (t[12] and t[10] or t[10] and t[14]) else ''`${12/.+/
		/}${12:'control' : {${13}}}`!p res=',' if (t[12] and t[14]) else ''`${14/.+/
		/}${14:'routes' : {${15}}} 
	}}${16/.+/,/}
	${16}
}${17/.+/,
/}${17});${18}
endsnippet
#estore
snippet estore "Ext.define... store" w
Ext.define('${1:`!p res = __import__('extpathloader').namify(path)`}',{
	'extend' : '${2:Ext.data.Store}'${3/.+/,
	/}${3:'requires' : [${4}]}${5/.+/,
	/}${5:'alias' : [${6}]}${7/.+/,
	/}${7:'alternateClassName' : '${8}'}${9/.+/,
	/}${9:'statics' : {${10}}}${11/.+/,
	/}${11:'config' : {${12/.+/
		/}${12:'storeId' : '${13}'}`!p res = ',' if (t[14] and t[12] or t[12] and t[16]) else ''`${14/.+/
		/}${14:'model' : '${15}'}`!p res=',' if (t[14] and t[16]) else ''`${16/.+/
		/}${16:'proxy' : {${17}}} 
	}}${18/.+/,/}
	${18}
}${19/.+/,
/}${19});${20}
endsnippet
snippet eview "Ext.define... view" w
Ext.define('${1:`!p res = __import__('extpathloader').namify(path)`}',{
	'extend' : '${2:Ext.Container}'${3/.+/,
	/}${3:'requires' : [${4}]}${5/.+/,
	/}${5:'alternateClassName' : '${6}'}${7/.+/,
	/}${7:'statics' : {${8}}}${9/.+/,
	/}${9:'xtype' : '${10}'}${11/.+/,
	/}${11:'config' : {${12/.+/
		/}${12:'cls' : '${13}'}`!p res = ',' if (t[14] and t[12] or t[12] and t[16]) else ''`${14/.+/
		/}${14:'style' : {${15}}}`!p res=',' if (t[14] and t[16]) else ''`${16/.+/
		/}${16:'items' : [${17}]} 
	}}${18/.+/,/}
	${18}
}${19/.+/,
/}${19});${20}
endsnippet


##testing
snippet des "describe" w 
describe('$1',function ($2) {`!p
if (t[3] and t[3].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''`${3}`!p
if (t[3] and t[3].find('\n') != 0):
	snip += '}'
else:
	res = '}'`);
endsnippet

snippet it "it" w 
it('$1',function ($2) {`!p
if (t[3] and t[3].find('\n') != 0):
	snip >> 1
	snip += ''
else:
	res = ''`${3}`!p
if (t[3] and t[3].find('\n') != 0):
	snip += '}'
else:
	res = '}'`);
endsnippet

post_jump "post_expand(snip);" 
post_jump "expand(snip);" 
priority 1
#TODO this worked__
#snippet "(^[^,]*|,[^,]*),(.*)" "tset" r
snippet "adksljfas" "tset" r
`!p
split = match.group(2).split(",")
snip.rv = match.group(1);
if vim.cnt != 0 and vim.rest and vim.snip and vim.at==None:
	vim.at=split
else:
	vim.cnt=0
if vim.cnt != 0 and vim.rest and vim.snip and vim.at != None:
	vim.snip.buffer[vim.snip.line]+=" " + ",".join(vim.at)
	split = None
if snip.c == "":
	vim.rest = split
	vim.at = None
`$1
endsnippet


#TODO this worked__
post_expand "expansion(snip)"
#snip.cursor.set(snip.line,len(snip.buffer[snip.line]))
post_jump "post_jump(snip)"
#TODO GOLD
#snippet "(^[^\,]*|\/[^\,]*)\,(.*)" "tset" r
snippet "NONE" "tset" r
`!p
vim.match = match
snip.rv=match.group(1)+","+match.group(2)
`$1
endsnippet

global !p
def do_rest3(snip,jump):
	if jump and vim.current.window.cursor[1] == snip.snippet_start[1]+1 and snip.buffer[snip.line][snip.snippet_start[1]-1] == " ":
		o = vim.current.window.cursor[1]-1
		snip.buffer[snip.line] = snip.buffer[snip.line][0:snip.snippet_start[1]-1]+snip.buffer[snip.line][snip.snippet_start[1]:]
		snip.cursor.set(snip.tabstops[snip.tabstop].start[0],snip.tabstops[snip.tabstop].start[1]) 
	elif vim.current.window.cursor[1] == snip.snippet_end[1]:
		cursor = vim.current.window.cursor
		vim.current.window.cursor = (snip.line+1,len(snip.buffer[snip.line]))
		result = get_open_ch(snip)
		ln = ln=len(result['comma_locs'])
		vim.current.window.cursor = cursor
		if len(result['open_locs'])==0 and ln>0:
			snip.cursor.set(snip.line,result['comma_locs'][ln-1]['col']+1)
			vim.eval('feedkeys("\<C-R>=UltiSnips#ExpandSnippet()\<CR>")')
		else:
			snip.cursor.set(snip.line,len(snip.buffer[snip.line]))
vim.do_rest3= do_rest3


def get_open_ch(snip,multiLine=False):
	buffer = snip.buffer
	col = vim.current.window.cursor[1]-1
	row = vim.current.window.cursor[0]-1
	cnt_bl = 0
	cnt_ar = 0
	cnt_pa = 0
	dist = row-1
	comma_found = False
	opens=[]
	commas=[]
	if multiLine:
		dist=0
	for y in range(row,dist,-1):
		line = buffer[y]
		if col == None:
			col = len(line)-1
		for x in range(col,0,-1):
			ch = line[x]
			if ch == ')':
				cnt_pa+=1
			elif ch == '(':
				cnt_pa-=1
				if cnt_pa < 0:
					opens.append({ch:'(',"col":col,"row":row})
					#return '('
			elif ch == ']':
				cnt_ar+=1
			elif ch == '[':
				cnt_ar-=1
				if cnt_ar < 0:
					opens.append({ch:'[',"col":col,"row":row})
			elif ch == '}':
				cnt_bl+=1
			elif ch == '{':
				cnt_bl-=1
				if cnt_bl < 0:
					opens.append({ch:'{',"col":col,"row":row})
					#return '{'
			elif ch == ',' and cnt_bl == 0 and cnt_ar == 0 and cnt_pa == 0:
				vim.eval("execute('let g:test="+str(col)+"')")
				commas.append({'col':x,"row":y})
		col = None
	return {"open_locs":opens,"comma_locs":commas}
def post_jump2(snip):
	vim.snip = snip
	if vim.match == None:
		y = len(snip.buffer[snip.line])
		snip.cursor.set(snip.line,y)
		#asdflj
		cursor = vim.current.window.cursor
		vim.current.window.cursor = (snip.line+1,len(snip.buffer[snip.line]))
		result = get_open_ch(snip)
		ln = ln=len(result['comma_locs'])
		vim.current.window.cursor = cursor
		vim.rest= None
		if len(result['open_locs'])==0 and ln>0:
			col = result['comma_locs'][ln-1]['col']
			snip.buffer[snip.line] = snip.buffer[snip.line][:col]+' ' +snip.buffer[snip.line][col+1:]
			snip.cursor.set(snip.line,result['comma_locs'][ln-1]['col'])

			#vim.eval('feedkeys("\<C-R>=UltiSnips#ExpandSnippet()\<CR>")')
		return

	snip.cursor.set(snip.line,len(snip.buffer[snip.line]));
	y = len(snip.buffer[snip.line])
	vim.r = y
	snip.buffer[snip.line]+=' ' +vim.rest#+vim.match.group(2);
	vim.rest = None
	snip.cursor.set(snip.line,y)
	#vim.current.window.cursor = (snip.line+1,len(snip.buffer[snip.line]))
	#result = get_open_ch(snip)
	#ln = ln=len(result['comma_locs'])
	#if len(result['open_locs'])==0 and ln>0:
		#snip.cursor.set(snip.line,result['comma_locs'][ln-1]['col']+1)
		#vim.eval('feedkeys("\<C-R>=UltiSnips#ExpandSnippet()\<CR>")')
	vim.match = None
	vim.do_rest_called = False
def expansion2(snip):
	vim.snip = snip
	#buffer = snip.buffer
	#split = vim.match.group(2).split(",")
	#match = vim.match
	#num=0
	#past = ""
	ln = len(vim.comma_locs)-1
	vim.rest = snip.buffer[snip.line][vim.comma_locs[ln]['col']+1:]
	snip.buffer[snip.line] = snip.buffer[snip.line][0:vim.comma_locs[ln]['col']]
	#snip.buffer[snip.line] = str(vim.comma_locs[ln]['col'])
	#vim.rest=''
	#snip.cursor.set(snip.line,len(snip.buffer[snip.line])/)
def test2(snip):
	cursor = vim.current.window.cursor
	#vim.current.window.cursor = (snip.line+1,len(snip.buffer[snip.line])+1)
	result = get_open_ch(snip)
	#vim.current.window.cursor = cursor
	if (len(result['open_locs'])==0 and len(result['comma_locs'])):
		#snip.buffer[snip.line]=str(result['comma_locs'])
		vim.comma_locs = result['comma_locs']
		return True
	#elif re.match("[\)\}\]\;]",snip.buffer[snip.line][snip.cursor[1]-1]) and snip.buffer[snip.line][snip.cursor[1]-1] != ',':
		#snip.buffer[snip.line]+=','
		##snip.cursor.set(snip.line,len(snip.buffer[snip.line]))
		#cursor = vim.current.window.cursor
		#vim.current.window.cursor = (snip.line+1,len(snip.buffer[snip.line]))
		#result = get_open_ch(snip)
		#vim.comma_locs = result['comma_locs']
		#return True
	return False


	#line = snip.line
	#row = snip.buffer[line]
	#col = vim.current.window.cursor[1]
	#comma_found = False
	#for x in range(col-1,0,-1):
		#ch = row[x]
		#if ch == '(' or ch == ')' or ch == '{' or ch == '}' or ch == '[' or ch ==']':
			#comma_found = False
			#break
		#elif ch == ',':
			#comma_found = True
	#return comma_found
endglobal

#snippet ".*" "test2" "test2(snip)" re
priority 0
post_expand "expansion2(snip)"
#snip.cursor.set(snip.line,len(snip.buffer[snip.line]))
post_jump "post_jump2(snip)"
#snippet "(^[^\,]*|\/[^\,]*)\,(.*)" "tset" "test2(snip)" re
#snippet "(.*)" "tset" "test2(snip)" re
snippet "LAST_WORKING" "test" r
`!p
vim.match = match
snip.rv=match.group(1)
#snip.rv=match.group(1)+","+match.group(2)
`$1
endsnippet

global !p
def test3 (snip,jump=1):
	col = snip.cursor[1]
	row = snip.cursor[0]
	#buffer = snip.buffer
	line = snip.buffer[row][col:]
	test = re.match("([\\W]+)",line)
	if test == None:
		test = re.match("([\\w]+)",line)
	#if test == None:
		#test = re.match("([\\s]+)",line)
	if test:
		if col == 0:
			col += 1
		vim.m = test
		vim.c = col
		return True
	return False
def post_expand4 (snip,jump=1):
	print ("post_expadn")
	if vim.m:
		if vim.m.group(0):
			#snip.cursor.set(snip.line,len(snip.buffer[snip.line]))
			snip.cursor.set(snip.line,vim.c +  len(vim.m.group(0)))
		vim.m = None
	#snip.buffer[snip.line]+=''
	#snip.cursor.set(snip.line,len(snip.buffer[snip.line])+1)
endglobal



#ALMOST
#priority -1
#post_jump "post_expand4(snip)"
#snippet "(.*)" "test" "test3(snip)" re
#`!p
#snip.rv = match.group(1)
#`$1
#endsnippet


global !p
from UltiSnips import UltiSnips_Manager
def do_rest2(snip,jump):
	#if vim.r:
		#snip.buffer[snip.line] = snip.buffer[snip.line][0:vim.r]+snip.buffer[snip.line][vim.r+1:]
		#vim.r=None
	if jump:
		start = snip.snippet_end
		snip.cursor.set(snip.tabstops[snip.tabstop].start[0],snip.tabstops[snip.tabstop].start[1]) 
	else:
		snip.cursor.set(snip.tabstops[snip.tabstop].start[0],snip.tabstops[snip.tabstop].start[1]) 
	if jump and vim.current.window.cursor[1] == snip.snippet_start[1]+1 and snip.buffer[snip.line][snip.snippet_start[1]-1] == " ":
		o = vim.current.window.cursor[1]-1
		snip.buffer[snip.line] = snip.buffer[snip.line][0:snip.snippet_start[1]-1]+snip.buffer[snip.line][snip.snippet_start[1]:]
		snip.cursor.set(snip.line,o)
		#b = vim.eval('feedkeys("\<C-R>=UltiSnips#ExpandSnippet()\<CR>")')
		#UltiSnips_Manager.expand()
	#elif vim.current.window.cursor[1] == snip.snippet_end[1]:
	if vim.current.window.cursor[1] == snip.snippet_end[1]:
		o = vim.current.window.cursor[1]-2
		snip.cursor.set(snip.line,len(snip.buffer[snip.line]))
		#if snip.buffer[snip.line].find(',') !=-1:
			#b = vim.eval('feedkeys("\<C-R>=UltiSnips#ExpandSnippet()\<CR>")')
	vim.snip = snip
def post_jump(snip):
	vim.snip = snip
	if vim.match == None:
		y = len(snip.buffer[snip.line])
		snip.cursor.set(snip.line,y)
		return

	snip.cursor.set(snip.line,len(snip.buffer[snip.line]));
	y = len(snip.buffer[snip.line])
	vim.r = y
	snip.buffer[snip.line]+=' '+vim.match.group(2);
	snip.cursor.set(snip.line,y)
	vim.match = None
	vim.do_rest_called = False
def expansion(snip):
	vim.snip = snip
	#buffer = snip.buffer
	#split = vim.match.group(2).split(",")
	#match = vim.match
	#num=0
	#past = ""
	snip.buffer[snip.line] = vim.match.group(1)
	#snip.cursor.set(snip.line,len(snip.buffer[snip.line]))
endglobal

priority 1
post_jump "expansion(snip)"
#snippet "(^[^,]*|,[^,]*),(.*)" "tset" r
snippet "adslkfjaf" "tset" r
`!p
vim.match = match;
snip.rv=match.group(1) +","+ match.group(2)
#split = match.group(2).split(",")
#snip.rv=split[0]
#snip.rv=""
#snip.rv = split[0]
`
endsnippet

# vim:ft=snippets:

