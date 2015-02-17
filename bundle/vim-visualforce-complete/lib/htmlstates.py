NONE = 0
EMMET = 1
ELEMENT = 2
NAME = 4
ATTRIBUTE = 8
D_QUOTE = 16
S_QUOTE = 32
TEXT = 64
MULTIPLIER = 128
END = 256

class State:
    def __init__(self):
        self.first_word = ''
        self.first_delim = ''
        self.type = NONE
#class State:
    #def __init__(self,type):
        #self.value = NONE
        #self.word = ''
        #self.location= -1
        #if type == None:
            #self.type = None
        #else:
            #self.type = type
        #self.had = type
        #self.parent = None
        #self.escaped = 0
        #self.inherited = None
        #self.level = -1


#class States:
    #def __init__(self):
        #self.states = []
        #self.active = None
    #def pop(self):
        #if len(self.states) > 0:
            #self.states.pop()
        #return self
    #def next(self,state)
        #self.states.append(result = State(state))
        #active = self.active
        #self.active = result
        #self.active.parent = active 
        #if active.parent:
            #self.inherited = active.type | active.parent.type
        #else:
            #self.inherited = active.type
        #return self
    #def prev(self,state)
        #self.states.pop()
        #self.active = self.states[-1]
        #return self
