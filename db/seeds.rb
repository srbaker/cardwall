project = Project.create title: 'A Simple Project'

todo = project.lanes.create title: 'To Do'
doing = project.lanes.create title: 'Doing'
done = project.lanes.create title: 'Done'

todo.cards.create title: 'First Card', body: 'Lorem Ipsum'
todo.cards.create title: 'Second Card'

doing.cards.create title: 'In progress card'

done.cards.create title: 'All done!'
