

type task = {
  id: string,
  text: string,
  done: bool,
}
type taskFunction = (string) => unit
type tasks = array<task>
type contextValue = { tasks: tasks, addTask: taskFunction, deleteTask: taskFunction, selectTask: taskFunction }

let context = React.createContext({
    tasks: [],
    addTask: _ => (),
    deleteTask: _ => (),
    selectTask: _ => ()
})

let provider = React.Context.provider(context)

module Provider = {
  @module("uuid") external uuid: unit => string = "v4"

  @react.component
  let make = (~children) => {

  let (tasks, setTasks) = React.useState(() => [])
  let addTask = (text) => {

    let newTask = {
      id: uuid(),
      text,
      done: false,
    }
    setTasks(tasks => tasks->Belt.Array.concat([newTask]))
    }

  let deleteTask = id => {
    setTasks(tasks => tasks->Belt.Array.keep(task => task.id !== id))
  }

  let selectTask = id => {
    setTasks(tasks =>
      tasks->Belt.Array.map(task =>
        if task.id === id {
          {...task, done: !task.done}
        } else {
          task
        }
      )
    )
  }
    React.createElement(provider, {
        children: children,
        value: {tasks, addTask, selectTask, deleteTask }
      })
  }
  }
let useTasks = () => {
  React.useContext(context)
}
