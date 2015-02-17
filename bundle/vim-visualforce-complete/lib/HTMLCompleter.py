
from os import path
import completer as _completer


class Application
    def __init__(self):
        self.events = {"_completer":[]}
        self.completer = None
    def setup(config):
        self.completer = _completer.Completer()
        if 'completion_directories' in config:
            directories = config['completion_directories']
            for name in directories:
                paths = directories[name]
                for p in paths:
                    split = path.splitext(p)
                    if split[1] == '.py':
                        (import p)(self)
                    elif split[1] == '.json':
                        self.completer.addSymbolsFromFile(name,directory)
    def getCompleter():
        return self.completer
    def on (name,fn):
        if ('_'+name) in self.events:
            self.events['_'+name].append(fn)
    def getCompletions(line,column,project,type,name,buffer):
        active_line = buffer[line]
        for fn in self.events._complete:
            fn(line,column,project,type,name,buffer)
        return completer.getCompletions(line=active_line,column=column)

application = Application()


setup = application.setup
on = application.on
getCompletions = application.getCompletions

del application
del Application

