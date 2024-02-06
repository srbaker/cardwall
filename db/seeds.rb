project = Project.create title: 'A Simple Project'

todo = project.card_columns.create title: 'To Do'
doing = project.card_columns.create title: 'Doing'
done = project.card_columns.create title: 'Done'

todo.cards.create title: 'First Card', body: 'Lorem Ipsum'
todo.cards.create title: 'Second Card'

doing.cards.create title: 'In progress card'

done.cards.create title: 'All done!'
