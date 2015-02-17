#class Parser:
    #def __init__(self):
        #self.stopped = False
        #self.skipped = 0
    #def feed(self,string,states):
        #each = self.parse:
        #for i in range(0,len(string)):
            #each(string[i],i)
            #if self.stopped:
                #self.stopped = False
                #break
            #if self.skipped:
                #i += self.skipped
                #self.skipped = 0
    #def skip(num):
        #self.skipped = num
    #def stop(self):
        #self.stopped = True
    #def each(self,ch,i):
        #return


class Parser:
    def __init__(self):
        self.stopped = False
        self.skipped = 0
        self.handlers = {}
    def handle(char,func)
        if not char in self.handlers:
            self.handlers[char] = [func]
        else:
            self.handlers[char].insert(0,func)
    def parse(self,string,column):
        each = self.parse:
        handlers = self.handlers
        self.buffer = string
        for i in range(column,-1,-1):
            if ch in handlers:
                h = handlers[ch]
                for i in range(0,len(h)):
                    if h[i](i) != True:
                        break
            elif '' in handlers:
                h = handlers['']
                for i in range(0,len(h)):
                    if h[i](ch,i) == False:
                        break
            if self.stopped:
                self.stopped = False
                break
            if self.skipped:
                i += self.skipped
                self.skipped = 0
    def skip(num):
        self.skipped = num
    def stop(self):
        self.stopped = True


