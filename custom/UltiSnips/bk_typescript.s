extends javascript

priority 1

snippet ",t" "type" r
<$1>
endsnippet

snippet "\bfn\b" "function class es6" r
function $1 ($2) : ${3:void} {`!p
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

snippet "\bfc\b" "function class es6" r
$1 ($2) : ${3:void} {`!p
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


#EXPORTS
snippet "\bfa\b" "arrow function" r
($1) : ${2:void} => 
endsnippet

snippet "\bfao\b" "arrow function" r
($1) : ${2:void} => {`!p
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

snippet "\bfg\b" "function generator" r
function *$1 ($2) : ${3:void} {`!p
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

snippet "\bfcg\b" "function generator class" r
*$1 ($2) : ${3:void} {`!p
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

snippet "\bim\b|\bimpl\b" "implements" r
implements ${1}
endsnippet

#CLOSURE
snippet "\bcla\b" "closure..." r
((${1}) : ${2:void} => $3)($4)
endsnippet

#CLOSURE
snippet "\bclo|close|closure\b" "closure..." r
(function (${1}) : ${2:void} `!p 
if (t[3] and t[3].find('\n') != 0):
	snip += '{'
	snip >> 1
	snip += ''
else:
	res = '{'
`${3}`!p
if (t[3]):
	snip >> 1
	snip += ''
else:	
	res = ' '
`return $4;`!p
if (t[4] != 'fn '):
	t[4] = t[4].strip()
if (t[3]):
	snip.rv += '\n'
	snip.rv += snip.mkline('')
else:	
	res = ''
`})(${5})
endsnippet

snippet pr "private"
private $1;
endsnippet

snippet "\b([\,]{0,1})ta\b" "type annotation" r
`!p
if match.group(1):
	snip.rv = " "
`: $1
endsnippet

snippet "\bab\b|\babs\b" "absract" r
abstract $1
endsnippet


#class block
snippet "\bin\b" "interface" r
interface`!p
if t[1] and t[1][0] != " ":
	snip.rv += " "
`$1 {`!p
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
