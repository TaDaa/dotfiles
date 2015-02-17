import visualforce,time

i = 5
def inc_test(y):
    y+=5

inc_test(i)
print(i)
print(i)
print(i)


#result3 = visualforce.parseComponents(project='tests/test1',file_names=['tests/test1/testpage.vfc'])
#print result3
#with open('tests/test8/buffer.file') as buffer:
    #visualforce.getCompletions(line=0,column=18,project='tests/test8',type='.vfp',name="testpage.page",buffer=buffer.readlines())


def test():
#test1 - getOtherFiles returns files
    result1 = len(visualforce.getOtherFiles(project='tests/test1',excluded_name=None))

    if result1 != 2:
        print 'Test1 - ERROR - expected 2, but got ' + str(result1) + ' files'
    else:
        print 'Test1 - SUCCESS - expected 2, got 2'
    print result1

    time.sleep(0.01)

    #test2 - getOtherFiles can exclude based on name
    result2 = len(visualforce.getOtherFiles(project='tests/test1',excluded_name='tests/test1/testpage.vfp'))
    if result2 != 1:
        print 'Test2 - ERROR - expected 1, but got ' + str(result2) + ' files'
    else:
        print 'Test2 - SUCCESS - expected 1, got 1'
    print result2
        
    time.sleep(0.01)

    #test3 - parseComponents - works with simple component
    with open('tests/test1/testpage.vfc','w') as f:
        f.write('<apex:component></apex:component>')
        f.flush()


    result3 = visualforce.parseComponents(project='tests/test1',file_names=['tests/test1/testpage.vfc'])
    if not 'c:testpage' in result3[0]:
        print 'Test3a - ERROR - expected c:testpage component to be defined' 
    else:
        print 'Test3a - SUCCESS - c:testpage component exists'
        result3 = visualforce.parseComponents(project='tests/test1',file_names=['tests/test1/testpage.vfc'])
        count = 0
        for (name) in result3[1]:
            if name == 'c:testpage':
                count += 1
        if count != 1:
            print 'Test3b - ERROR - expected c:testpage count to be 1, but got' + count
        else:
            print 'Test3b - SUCCESS - got correct c:testpage count'

    time.sleep(0.01)

    #test4 - parseComponents does not reparse with no changes
    if not 'tests/test1/testpage.vfc' in visualforce.folder_map['tests/test1']:
        print 'Test4 - ERROR - folder_map time was not set'
    else:
        mtime = visualforce.folder_map['tests/test1']['tests/test1/testpage.vfc']
        result4 = visualforce.parseComponents(project='tests/test1',file_names=['tests/test1/testpage.vfc'])
        if mtime != visualforce.folder_map['tests/test1']['tests/test1/testpage.vfc']:
            print 'Test4 - ERROR - time was set again with no changes'
        else:
            print 'Test4 - SUCCESS - time was not set again with no changes'
        print result4

    time.sleep(0.01)

    if not 'tests/test1/testpage.vfc' in visualforce.folder_map['tests/test1']:
        print 'Test5 - ERROR - folder_map time was not set'
    else:
        mtime = visualforce.folder_map['tests/test1']['tests/test1/testpage.vfc']
        with open('tests/test1/testpage.vfc','w') as f:
            f.write('<apex:component><apex:attribute name="test" description="hi"></apex:attribute></apex:component>')
            f.flush()
        result5 = visualforce.parseComponents(project='tests/test1',file_names=['tests/test1/testpage.vfc'])
        if mtime == visualforce.folder_map['tests/test1']['tests/test1/testpage.vfc']:
            print 'Test5 - ERROR - time was NOT set again with changes'
        else:
            print 'Test5 - SUCCESS - time was set again with changes'
        print result5
        if not 'c:testpage' in result5[0]:
            print 'Test6 - ERROR - c:testpage symbol was missing'
        else:
            print result5[0]
            if not 'attribs' in result5[0]['c:testpage']:
                print 'Test6 - ERROR - test attribute missing in c:testpage symbol'
            else:
                attributes = result5[0]['c:testpage']['attribs']
                found = False
                for (values) in result5[0]['c:testpage']['attribs'][1]:
                    if values['name'] == 'test':
                        found = True
                        break;

                if not found:
                    print 'Test6 - ERROR - test attribute missing in c:testpage symbol'
                else:
                    attribute = attributes[1][0]
                    if not 'description' in attribute:
                        print 'Test6 - ERROR description missing from test attribute'
                    else:
                        print 'Test6 - SUCCESS test attribute with description in c:testpage'

                time.sleep(0.01)

                with open('tests/test1/testpage.vfc','w') as f:
                    f.write('<apex:component></apex:component>')
                    f.flush()

                visualforce.parseComponents(project='tests/test1',file_names=['tests/test1/testpage.vfc'])
                if not 'c:testpage' in result5[0]:
                    print 'Test7 - ERROR - c:testpage symbol was missing'
                else:
                    if not 'attribs' in result5[0]['c:testpage']:
                        print 'Test7 - ERROR - test attribute missing in c:testpage symbol'
                    else:
                        attributes = result5[0]['c:testpage']['attribs']
                        if 'test' in attributes:
                            print 'Test7 - ERROR - test attribute present in c:testpage symbol'
                        else:
                            print 'Test7 - SUCCESS test attribute removed from c:testpage'



with open('tests/test8/buffer.file') as buffer:
    #result = visualforce.getCompletions(line=1,column=2,project='tests/test8',type='.vfp',name="testpage.page",buffer=buffer.readlines())
    result = visualforce.getCompletions(line=2,column=13,project='tests/test8',type='.vfp',name="testpage.page",buffer=buffer.readlines())
    print result
    #visualforce.getCompletions(line=0,column=5,project='tests/test8',type='.vfp',name="testpage.page",buffer=buffer.readlines())

