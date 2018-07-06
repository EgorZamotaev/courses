// Пример скрипта для обработки данных с модели "xcos_model_1.zcos"

// Очистка переменных
clear;

// Дано
U = 8;        //Ваше значение напряжения
L = 4.7e-3; 
R = 4.5;      //Ваше значение сопротивления
ke = 0.064;
km = ke;
m = 17e-3;
r = (23e-3)/2;
i = 48;
J = (m*r^2)/2;

// Симуляция

// Время симуляции можно установить в параметрах модели xcos
// для этого необходимо выбрать вкладку "Моделирование/Установка"
// и изменить параметр "Конечное время интегрирования"

path = get_absolute_file_path("lab_2_script.sce")
model_name = "xcos_model_1.zcos"

importXcosDiagram(path+model_name); 
xcos_simulate(scs_m,4);

// Инициализация первого окна и график угловой скорости
scf(0);
// Выбираем текущие оси (get current axis)
h = gca();
// Выставляем пределы [xmin, ymin, xmax, ymax]
h.data_bounds = [0, 0 ; 10, 20];
plot(omega.time, omega.values, "b-");
title("График угловой скорости", "fontsize", 4);
xlabel("t, с", "fontsize", 4);
// Пример использования символов TeX для записи формул
ylabel("$\omega, рад/с$", "fontsize", 4);

// Инициализация второго окна и график тока
scf(1);
h = gca();
h.data_bounds = [0, -5 ; 10, 5];
h.tight_limits= ["on","on"];
plot(I.time, I.values, "b-");
title("График тока", "fontsize", 4);
xlabel("t, с", "fontsize", 4);
ylabel("I, A", "fontsize", 4);
