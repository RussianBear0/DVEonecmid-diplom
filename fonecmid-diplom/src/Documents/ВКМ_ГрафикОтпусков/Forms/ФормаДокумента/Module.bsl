
&НаСервере
Процедура ОпределитьЧислоДнейОтпуска()
	
	Для Каждого СтрокаТч из Объект.ОтпускаСотрудников Цикл 
		РазностьДат = (СтрокаТч.ДатаОкончания - СтрокаТч.ДатаНачала) / 86400;
		СтрокаТч.РазностьДат = РазностьДат;
	КонецЦикла; 
 
КонецПроцедуры 


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ОпределитьЧислоДнейОтпуска();
КонецПроцедуры


&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	ОпределитьЧислоДнейОтпуска();
КонецПроцедуры

&НаКлиенте
Процедура ОтпускаСотрудниковДатаОкончанияПриИзменении(Элемент)
	ОпределитьЧислоДнейОтпуска();
КонецПроцедуры


&НаКлиенте
Процедура ОтпускаСотрудниковДатаНачалаПриИзменении(Элемент)
	ОпределитьЧислоДнейОтпуска();
КонецПроцедуры

&НаСервере
Функция ПолучитьДанныеТч()
	
	ТекущиеДанные = Объект.ОтпускаСотрудников.Выгрузить();
	АдресДанных = ПоместитьВоВременноеХранилище(ТекущиеДанные);
	
	Возврат АдресДанных;
КонецФункции

&НаКлиенте
Процедура АнализГрафика(Команда)
	ТекущиеДанные = ПолучитьДанныеТч();
	ПараметрыДляПередачи = Новый Структура ("АдресДанных",ТекущиеДанные);
	ПараметрыДляПередачи.Вставить("МесяцПериода", НачалоМесяца(Объект.Дата));
	ОткрытьФорму("Документ.ВКМ_ГрафикОтпусков.Форма.ФормаАнализГрафика", ПараметрыДляПередачи);
КонецПроцедуры



