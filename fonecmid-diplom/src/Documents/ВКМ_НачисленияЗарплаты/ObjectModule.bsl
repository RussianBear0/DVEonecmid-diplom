#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда     
	
#Область ОбработчикиСобытий 

Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	//Сформируем первоначальные движения по регистрам
	СформироватьДвижения();
	
	РассчитатьОсновныеНачисления(); 
	РассчитатьУдержания();
	
	ДвиженияВзаиморасчетыССотрудниками();
КонецПроцедуры    

Процедура СформироватьДвижения()  
	
	Для каждого СтрокаТЧ из Начисления Цикл
	//Если ВидНачисления = основные	
		Если ТипЗнч(СтрокаТЧ.ВидРасчёта) = Тип("ПланВидовРасчетаСсылка.ВКМ_ОсновныеНачисления") Тогда
			
			Движение = Движения.ВКМ_ОсновныеНачисления.Добавить();
			Движение.ПериодРегистрации = Дата;
			Движение.ВидРасчета = СтрокаТЧ.ВидРасчёта;
			Движение.ПериодДействияНачало = СтрокаТЧ.ДатаНачала;
			Движение.ПериодДействияКонец = СтрокаТЧ.ДатаОкончания;
			Движение.Сотрудник = СтрокаТЧ.Сотрудник;
			Движение.Размер = СтрокаТЧ.Размер;
			Если Движение.ВидРасчета = ПланыВидовРасчета.ВКМ_ОсновныеНачисления.Отпуск Тогда
				Движение.ДнейОтпуска = (СтрокаТЧ.ДатаОкончания - СтрокаТЧ.ДатаНачала) /86400;
			КонецЕсли;
				
		ИНАЧЕЕсли ТипЗнч(СтрокаТЧ.ВидРасчёта) = Тип("ПланВидовРасчетаСсылка.ВКМ_Удержания") Тогда 
	//Если мы удерживаем сумму из зп сотрудника		
			Движение = Движения.ВКМ_Удержания.Добавить();
			Движение.ПериодРегистрации = Дата;
			Движение.ВидРасчета = СтрокаТЧ.ВидРасчёта;
			Движение.ПериодДействияНачало = НачалоМесяца(СтрокаТЧ.ДатаНачала);
			Движение.ПериодДействияКонец = КонецМесяца(СтрокаТЧ.ДатаОкончания);
			Движение.Сотрудник = СтрокаТЧ.Сотрудник;
			Движение.Размер = СтрокаТЧ.Размер;
			
              
		КонецЕсли;
			
	КонецЦикла;

	Движения.ВКМ_ОсновныеНачисления.Записать(); 
	Движения.ВКМ_Удержания.Записать();

КонецПроцедуры 

#КонецОбласти 


#Область СлужебныеПроцедурыИФункции

Процедура РассчитатьОсновныеНачисления()

	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ВКМ_ОсновныеНачисления.НомерСтроки КАК НомерСтроки,
		|	ВКМ_ОсновныеНачисления.Сотрудник КАК Сотрудник,
		|	ЕСТЬNULL(ВКМ_ОсновныеНачисления.Размер, 0) КАК Размер
		|ПОМЕСТИТЬ ВТОсновныеНачисления
		|ИЗ
		|	РегистрРасчета.ВКМ_ОсновныеНачисления КАК ВКМ_ОсновныеНачисления
		|ГДЕ
		|	ВКМ_ОсновныеНачисления.Регистратор = &Регистратор
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|ВЫБРАТЬ
		|	ВКМ_ВыполненныеСотрудникомРаботыОбороты.Сотрудник КАК Сотрудник,
		|	ЕСТЬNULL(ВКМ_ВыполненныеСотрудникомРаботыОбороты.ЧасовКОплатеПриход, 0) КАК ЧасовКОплатеПриход,
		|	ЕСТЬNULL(ВКМ_ВыполненныеСотрудникомРаботыОбороты.СуммаКОплатеПриход, 0) КАК СуммаКОплатеПриход
		|ПОМЕСТИТЬ ВТВыполненныеРаботы
		|ИЗ
		|	РегистрНакопления.ВКМ_ВыполненныеСотрудникомРаботы.Обороты(&НачалоМесяца, &КонецМесяца, , ) КАК ВКМ_ВыполненныеСотрудникомРаботыОбороты
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|ВЫБРАТЬ
		|	ВТВыполненныеРаботы.Сотрудник КАК Сотрудник,
		|	ВТВыполненныеРаботы.ЧасовКОплатеПриход КАК ЧасовКОплате,
		|	ВТВыполненныеРаботы.СуммаКОплатеПриход КАК СуммаКОплате,
		|	ВТОсновныеНачисления.Размер КАК Размер,
		|	ВТОсновныеНачисления.НомерСтроки КАК НомерСтроки
		|ИЗ
		|	ВТОсновныеНачисления КАК ВТОсновныеНачисления
		|		ЛЕВОЕ СОЕДИНЕНИЕ ВТВыполненныеРаботы КАК ВТВыполненныеРаботы
		|		ПО (ВТВыполненныеРаботы.Сотрудник = ВТОсновныеНачисления.Сотрудник)";
	
	Запрос.УстановитьПараметр("КонецМесяца", КонецМесяца(Ссылка.Дата));
	Запрос.УстановитьПараметр("НачалоМесяца", НачалоМесяца(Ссылка.Дата));
	Запрос.УстановитьПараметр("Регистратор", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
		Пока Выборка.Следующий() Цикл
			
			Движение = Движения.ВКМ_ОсновныеНачисления[Выборка.НомерСтроки - 1];
			Если Выборка.СуммаКОплате <> Null Тогда     
				//Начисление зп для специалистов
				Движение.Результат = (Движение.Размер + Выборка.СуммаКОплате)-((Движение.Размер + Выборка.СуммаКОплате) / 100 * 13);
			Иначе
				//Начисление зп для административного персонала
				Движение.Результат = Движение.Размер -(Движение.Размер / 100 * 13); 
			КонецЕсли;

		КонецЦикла;
	
	 
	Движения.ВКМ_ОсновныеНачисления.Записать(,Истина);

КонецПроцедуры    

Процедура РассчитатьУдержания()     
		
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ВКМ_УдержанияБазаВКМ_ОсновныеНачисления.НомерСтроки КАК НомерСтроки,
		|	ВКМ_УдержанияБазаВКМ_ОсновныеНачисления.РезультатБаза КАК РезультатБаза
		|ИЗ
		|	РегистрРасчета.ВКМ_Удержания.БазаВКМ_ОсновныеНачисления(&Измерения, &Измерения, &Разрезы, ) КАК ВКМ_УдержанияБазаВКМ_ОсновныеНачисления
		|ГДЕ
		|	ВКМ_УдержанияБазаВКМ_ОсновныеНачисления.Регистратор = &Регистратор";
	
	Измерения = Новый Массив(1);
    Измерения[0] = "Сотрудник";

    Разрезы = Новый Массив(1);
    Разрезы[0] = "Регистратор";
    Запрос.УстановитьПараметр("Ссылка", Ссылка);
    Запрос.УстановитьПараметр("Измерения", Измерения);
    Запрос.УстановитьПараметр("Разрезы", Разрезы);
    Запрос.УстановитьПараметр("Регистратор", Ссылка);
    РезультатЗапроса = Запрос.Выполнить();

    ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();

    Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
        Движение = Движения.ВКМ_Удержания[ВыборкаДетальныеЗаписи.НомерСтроки - 1];
        Движение.Результат = ВыборкаДетальныеЗаписи.РезультатБаза * 13 / 100;
    КонецЦикла;

    Движения.ВКМ_Удержания.Записать(,Истина);

КонецПроцедуры 

Процедура ДвиженияВзаиморасчетыССотрудниками()
	
	МассивСотрудниковОтпуска = Новый Массив;
	Для Каждого СтрокаТч из Начисления Цикл
		Если СтрокаТч.ВидРасчёта = ПланыВидовРасчета.ВКМ_ОсновныеНачисления.Отпуск Тогда
			 МассивСотрудниковОтпуска.Добавить(СтрокаТч.Сотрудник);
		 КонецЕсли;
	 КонецЦикла;	
	 
	 Если МассивСотрудниковОтпуска.Количество() >= 1 Тогда
		РассчитатьОтпускные(МассивСотрудниковОтпуска);
	КонецЕсли;
	
	
	
	//Находим начисления зарплаты и удержания по текущему документу
	//При подсчёте итоговой суммы выплаты вычитаем из начисленного сумму всех удержаний
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ВКМ_ОсновныеНачисления.Сотрудник КАК Сотрудник,
		|	СУММА(ЕСТЬNULL(ВКМ_ОсновныеНачисления.Результат, 0)) КАК Результат
		|ПОМЕСТИТЬ ВТОсновныеНачисления
		|ИЗ
		|	РегистрРасчета.ВКМ_ОсновныеНачисления КАК ВКМ_ОсновныеНачисления
		|ГДЕ
		|	МЕСЯЦ(ВКМ_ОсновныеНачисления.ПериодРегистрации) = МЕСЯЦ(&ПериодРегистрации)
		|	И ВКМ_ОсновныеНачисления.Регистратор = &Регистратор
		|
		|СГРУППИРОВАТЬ ПО
		|	ВКМ_ОсновныеНачисления.Сотрудник
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|ВЫБРАТЬ
		|	ВКМ_Удержания.Сотрудник КАК Сотрудник,
		|	СУММА(ЕСТЬNULL(ВКМ_Удержания.Результат, 0)) КАК Результат
		|ПОМЕСТИТЬ ВТУдержания
		|ИЗ
		|	РегистрРасчета.ВКМ_Удержания КАК ВКМ_Удержания
		|ГДЕ
		|	МЕСЯЦ(ВКМ_Удержания.ПериодРегистрации) = МЕСЯЦ(&ПериодРегистрации)
		|	И ВКМ_Удержания.Регистратор = &Регистратор
		|
		|СГРУППИРОВАТЬ ПО
		|	ВКМ_Удержания.Сотрудник
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|ВЫБРАТЬ
		|	ВТОсновныеНачисления.Сотрудник КАК Сотрудник,
		|	СУММА(ЕСТЬNULL(ВТОсновныеНачисления.Результат, 0)) КАК ОсновныеНачисления,
		|	СУММА(ЕСТЬNULL(ВТУдержания.Результат, 0)) КАК Удержания
		|ИЗ
		|	ВТОсновныеНачисления КАК ВТОсновныеНачисления
		|		ЛЕВОЕ СОЕДИНЕНИЕ ВТУдержания КАК ВТУдержания
		|		ПО ВТОсновныеНачисления.Сотрудник = ВТУдержания.Сотрудник
		|
		|СГРУППИРОВАТЬ ПО
		|	ВТОсновныеНачисления.Сотрудник";
	
	Запрос.УстановитьПараметр("ПериодРегистрации", Дата);
	Запрос.УстановитьПараметр("Регистратор", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();

	Если НЕ РезультатЗапроса.Пустой() Тогда
		
		Пока Выборка.Следующий() Цикл
			Движение = Движения.ВКМ_ВзаиморасчетыССотрудниками.Добавить();
			Движение.Период = Дата;
			Движение.Сотрудник = Выборка.Сотрудник;
			Движение.Сумма = Выборка.ОсновныеНачисления - Выборка.Удержания; 
			Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
			Движение.Регистратор = Ссылка;
		КонецЦикла;   
		
	КонецЕсли;
		
	Движения.ВКМ_ВзаиморасчетыССотрудниками.Записать();
	
	//Для рассчёта отпускных переберем элементы таблицы и всех сотрудников с отпуском добавим в массив
	// и рассчитаем для них сумму отпускных
	
	
КонецПроцедуры

Процедура РассчитатьОтпускные(Сотрудники)
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ВКМ_ВзаиморасчетыССотрудникамиОбороты.Сотрудник КАК Сотрудник,
		|	ВКМ_ВзаиморасчетыССотрудникамиОбороты.СуммаПриход КАК СуммаПриход,
		|	ВКМ_ОсновныеНачисления.НомерСтроки КАК НомерСтроки
		|ИЗ
		|	РегистрРасчета.ВКМ_ОсновныеНачисления КАК ВКМ_ОсновныеНачисления
		|		ЛЕВОЕ СОЕДИНЕНИЕ РегистрНакопления.ВКМ_ВзаиморасчетыССотрудниками.Обороты(&НачалоПериода, &КонецПериода, , ) КАК ВКМ_ВзаиморасчетыССотрудникамиОбороты
		|		ПО ВКМ_ОсновныеНачисления.Сотрудник = ВКМ_ВзаиморасчетыССотрудникамиОбороты.Сотрудник
		|ГДЕ
		|	ВКМ_ОсновныеНачисления.ВидРасчета = &ВидРасчета
		|	И ВКМ_ОсновныеНачисления.Регистратор = &Регистратор
		|
		|СГРУППИРОВАТЬ ПО
		|	ВКМ_ВзаиморасчетыССотрудникамиОбороты.Сотрудник,
		|	ВКМ_ВзаиморасчетыССотрудникамиОбороты.СуммаПриход,
		|	ВКМ_ОсновныеНачисления.НомерСтроки";

	Запрос.УстановитьПараметр("НачалоПериода", ДобавитьМесяц(Дата, -12));
	Запрос.УстановитьПараметр("КонецПериода", Дата);
	Запрос.УстановитьПараметр("ВидРасчета", ПланыВидовРасчета.ВКМ_ОсновныеНачисления.Отпуск);  
	Запрос.УстановитьПараметр("Регистратор", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	КоличествоДнейВГоду = (Дата - ДобавитьМесяц(Дата, -12)) / 86400;  
	
	Пока Выборка.Следующий() Цикл

			Движение = Движения.ВКМ_ОсновныеНачисления[Выборка.НомерСтроки - 1];
        	ДнейОтпуска = (Движение.ПериодДействияКонец - Движение.ПериодДействияНачало) /86400;
			Движение.Результат = (Выборка.СуммаПриход / КоличествоДнейВГоду) * ДнейОтпуска;
			Движение.Результат = Движение.Результат-(Движение.Результат / 100 * 13); 
			
	КонецЦикла;   
	
		Движения.ВКМ_ОсновныеНачисления.Записать(,Истина);

	КонецПроцедуры
	
#КонецОбласти	

#КонецЕсли
