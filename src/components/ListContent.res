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
let make = (~tasks, ~onDelete, ~onSelect) => {
  switch tasks {
  | [] => <EmptyList />
  | value => <ul className={styles["list"]}>
      {tasks->Render.map((task, _) =>
        <ListItem onDelete onSelect key={task.id} id={task.id} text={task.text} done={task.done} />
      )}
    </ul>
  }
}
