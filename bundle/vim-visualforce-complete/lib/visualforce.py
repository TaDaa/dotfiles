from os import listdir,path,walk
from HTMLParser import HTMLParser
import time, bisect, emmetparser

import completer as _completer
#reload(_completer)
#import public_completions as vf_public

import emmetparser
#reload(emmetparser)
emmet_parser = emmetparser.Parser()

import componentparser
#reload(componentparser)
component_parser = componentparser.Parser()

import utils
#reload(utils)

import completer

folder_map = {}


import sortlist
#reload(sortlist)

completer = _completer.Completer()

#we need tag lookup
#we need attribute lookup

completer.addSymbolsFromFile('visualforce',path.join(path.dirname(path.realpath(__file__)) , 'completions/visualforce_completions.json'))

completer.addSymbolsFromFile('html',path.join(path.dirname(path.realpath(__file__)) , 'completions/html_completions.json'))
completer.addSymbolsFromFile('svg',path.join(path.dirname(path.realpath(__file__)) , 'completions/svg_completions.json'))

user_symbols = component_parser.getSymbols()
completer.addSymbols('custom',user_symbols)



component_extensions = ['.component','.vfc']
def parse_components(project):
    files = utils.getModifiedFiles(project = project,extensions=component_extensions,excluded_names = None)

    import vim
    for f in files:
        if f.extension == '.component' or f.extension == '.vfc':
            if f.removed == False:
                with open(f.path,'r') as stream:
                    component_parser.parse('c:'+f.name,stream.read())
            else:
                name = f.name
                user_symbols.remove('c:'+name)


def getCompletions(line,column,project,type,name,buffer):
    if not project in folder_map:
        folder_map[project] = {}

    active_line = buffer[line]
    parse_components(project)

    if type == 'vfc':
        component_parser.parse(''.join(buffer))

    return completer.getCompletions(line=active_line,column=column)
