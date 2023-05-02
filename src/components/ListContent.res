@module("./ListContent.module.css") external styles: {..} = "default"

module EmptyList = {
  @react.component
  let make = () => {
    <div className={styles["emptyList"]}>
      <PhosphorReact.ClipboardText size={72} />
      <strong> {"Você ainda não tem tarefas cadastradas"->React.string} </strong>
      {"Crie tarefas e organize seus itens a fazer"->React.string}
    </div>
  }
}

@react.component
let make = () => {
  let {tasks} = UseTasksHook.useTasks()
  let createdTasksCount = tasks->Js.Array2.length

  let doneTasksCount = tasks->Js.Array2.filter(tasks => tasks.done)->Js.Array2.length
  <div className={styles["listContent"]}>
    <header>
      <div className={styles["createdTasks"]}>
        {"Tarefas criadas"->React.string}
        <span> {createdTasksCount->React.int} </span>
      </div>
      <div className={styles["doneTasks"]}>
        {"Concluídas"->React.string}
        <span>{doneTasksCount->React.int}</span>
      </div>
    </header>
    {switch tasks {
    | [] => <EmptyList />
    | _ =>
      <ul className={styles["list"]}>
        {tasks->Render.map((task, _) =>
          <Task key={task.id} id={task.id} text={task.text} done={task.done} />
        )}
      </ul>
    }}
  </div>
}
