@module("./List.module.css") external styles: {..} = "default"

@react.component
let make = () => {
  <div className={styles["main"]}>
    <header className={styles["header"]}>
      <Form />
    </header>
    <ListContent />
  </div>
}
