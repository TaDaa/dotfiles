class States:
    def __init__(self):
        self.states = []
        self.active = None
    def next (self,state):
        self.states.push(state)
        self.active = state
    def prev():
        if len(self.states):
            self.states.pop()
            self.active = self.states[-1]



