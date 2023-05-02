%%raw("import './global.css'")
@module("./App.module.css") external styles: {..} = "default"

@react.component
let make = () => {
  <div className={styles["wrapper"]}>
    <Header />
    <main className={styles["content"]}>
      <UseTasksHook.Provider>
        <List />
      </UseTasksHook.Provider>
    </main>
  </div>
}
