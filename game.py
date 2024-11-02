import tkinter as tk

class GameApp(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Multi-Screen Game")
        self.geometry("400x300")

        self.frames = {}
        for F in (MainScreen, Game1Screen, Game2Screen):
            page_name = F.__name__
            frame = F(parent=self, controller=self)
            self.frames[page_name] = frame
            frame.grid(row=0, column=0, sticky="nsew")

        self.show_frame("MainScreen")

    def show_frame(self, page_name):
        frame = self.frames[page_name]
        frame.tkraise()

class MainScreen(tk.Frame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.controller = controller
        label = tk.Label(self, text="Main Screen")
        label.pack(side="top", fill="x", pady=10)

        button1 = tk.Button(self, text="Go to Game 1",
                            command=lambda: controller.show_frame("Game1Screen"))
        button1.pack()

        button2 = tk.Button(self, text="Go to Game 2",
                            command=lambda: controller.show_frame("Game2Screen"))
        button2.pack()

class Game1Screen(tk.Frame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.controller = controller
        label = tk.Label(self, text="Game 1 Screen")
        label.pack(side="top", fill="x", pady=10)

        button = tk.Button(self, text="Back to Main Screen",
                           command=lambda: controller.show_frame("MainScreen"))
        button.pack()

class Game2Screen(tk.Frame):
    def __init__(self, parent, controller):
        super().__init__(parent)
        self.controller = controller
        label = tk.Label(self, text="Game 2 Screen")
        label.pack(side="top", fill="x", pady=10)

        button = tk.Button(self, text="Back to Main Screen",
                           command=lambda: controller.show_frame("MainScreen"))
        button.pack()

if __name__ == "__main__":
    app = GameApp()
    app.mainloop()