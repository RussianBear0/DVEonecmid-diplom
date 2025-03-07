#Область ДоработкиФормы
//Задание 1.1 Вывод элементов на форму договора Денисов В.Е.  25.01.2025
&НаСервере
Процедура ВидДоговораПриИзмененииНаСервере()
	
	//Если Абонентское обслуживание тогда добавим реквизиты в противном случае удалим реквизиты
	Если Объект.ВидДоговора = Перечисления.ВидыДоговоровКонтрагентов.ВКМ_АбонентскоеОбслуживание Тогда
		
		ДобавитьЭлементыАбонентскогоОбслуживания();	
		
	Иначе
		Если Элементы.Найти("ПериодДействияНачало") <> Неопределено Тогда
			УбратьЭлементыАбонентскогоОбслуживания();
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ВидДоговораПриИзменении(Элемент)
	//Если изменяется объект "ВидДоговора"
	ВидДоговораПриИзмененииНаСервере();
КонецПроцедуры

Процедура ДобавитьЭлементыАбонентскогоОбслуживания()
	//ЭлементПериодДействия
	ЭлементПериодДейсвтвия = Элементы.Добавить("ПериодДействияНачало", Тип("ПолеФормы"), ЭтаФорма);
	ЭлементПериодДейсвтвия.Вид = ВидПоляФормы.ПолеВвода;
	ЭлементПериодДейсвтвия.ПутьКДанным = "Объект.ВКМ_ПериодДействияНачало";
	
	ЭлементПериодДейсвтвия = Элементы.Добавить("ПериодДействияКонец", Тип("ПолеФормы"), ЭтаФорма);
	ЭлементПериодДейсвтвия.Вид = ВидПоляФормы.ПолеВвода;
	ЭлементПериодДейсвтвия.ПутьКДанным = "Объект.ВКМ_ПериодДействияКонец";
	
	//ЭлементСуммаПлаты
	ЭлементСуммаПлаты = Элементы.Добавить("СуммаПлаты", Тип("ПолеФормы"), ЭтаФорма);
	ЭлементСуммаПлаты.Вид = ВидПоляФормы.ПолеВвода;
	ЭлементСуммаПлаты.ПутьКДанным = "Объект.ВКМ_СуммаПлаты";
	
	//ЭлементСтоимостьЧаса
	ЭлементСтоимостьЧаса = Элементы.Добавить("СтоимостьЧаса", Тип("ПолеФормы"), ЭтаФорма);
	ЭлементСтоимостьЧаса.Вид = ВидПоляФормы.ПолеВвода;
	ЭлементСтоимостьЧаса.ПутьКДанным = "Объект.ВКМ_СтоимостьЧаса";
КонецПроцедуры

Процедура УбратьЭлементыАбонентскогоОбслуживания()
	
	Элементы.Удалить(Элементы.ПериодДействияНачало);
	Элементы.Удалить(Элементы.ПериодДействияКонец);
	Элементы.Удалить(Элементы.СуммаПлаты);
	Элементы.Удалить(Элементы.СтоимостьЧаса);

КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ) 
	ВидДоговораПриИзмененииНаСервере();
КонецПроцедуры



#КонецОбласти