if !has('python')
	echo 'Error:Required vim compiled with +python'
	finish
endif

function! sfdc#Complete (findstart,base,type)

python << EOF
import vim,httplib,json

line = int(vim.eval('line(".")'))-1
column = int(vim.eval('col(".")'))-1
params = {
	"request" : "completions",
        "type" : vim.eval('a:type'),
        "data" : vim.eval('join(getline(1,"$"),"\n")'),
	"column" : column,
	"line" : line
}
conn = httplib.HTTPConnection('127.0.0.1:9112')
conn.request('POST','',json.dumps(params))
response = conn.getresponse()
data = response.read()
#data = json.loads(data)
#subtract length can be determined by
#simulatenous walk forward and backword (forward on completion, backward in buffer)
conn.close()
vim.command("let result= %s"% data)

EOF
return {'words' : result}
endfunction



function! sfdc#ApexComplete (findstart, base) abort
	if a:findstart
		return col('.')
	endif
	return sfdc#Complete(a:findstart,a:base,'apxc')
endfunction
function! sfdc#VisualForceComplete(findstart,base) abort
	if a:findstart
		return col('.')
	endif
	return sfdc#Complete(a:findstart,a:base,'vfp')
endfunction


