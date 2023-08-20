import Foundation

// Definindo a classe Task
class Task {
    let title: String
    var description: String
    var isCompleted: Bool
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
        self.isCompleted = false
    }
}

// Definindo a classe TaskList
class TaskList {
    var tasks: [Task] = []
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func removeTask(at index: Int) {
        tasks.remove(at: index)
    }
    
    func completeTask(at index: Int) {
        tasks[index].isCompleted = true
    }
    
    func printTasks() {
        for (index, task) in tasks.enumerated() {
            let status = task.isCompleted ? "Concluída" : "Pendente"
            print("\(index + 1). \(task.title) - \(status)")
        }
    }
}

// Criando algumas tarefas de exemplo
let task1 = Task(title: "Comprar leite", description: "Ir ao supermercado comprar leite.")
let task2 = Task(title: "Estudar Swift", description: "Dedicar 1 hora de estudo de Swift.")
let task3 = Task(title: "Fazer exercícios", description: "Realizar exercícios físicos por 30 minutos.")

// Criando uma lista de tarefas
let taskList = TaskList()
taskList.addTask(task1)
taskList.addTask(task2)
taskList.addTask(task3)

// Marcar uma tarefa como concluída
taskList.completeTask(at: 1)

// Remover a segunda tarefa
taskList.removeTask(at: 1)

// Imprimir as tarefas restantes
print("Lista de Tarefas:")
taskList.printTasks()
