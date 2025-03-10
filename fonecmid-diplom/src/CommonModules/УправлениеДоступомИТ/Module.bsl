
// Заполняет описания поставляемых профилей групп доступа и
// переопределяет параметры обновления профилей и групп доступа.
//
// Для автоматической подготовки содержимого процедуры следует воспользоваться инструментами
// разработчика для подсистемы Управление доступом.
//
// Параметры:
//  ОписанияПрофилей - Массив из см. УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа,
//                               см. УправлениеДоступом.НовоеОписаниеПапкиПрофилейГруппДоступа
//  ПараметрыОбновления - Структура:
//   * ОбновлятьИзмененныеПрофили - Булево - начальное значение Истина.
//   * ЗапретитьИзменениеПрофилей - Булево - начальное значение Истина.
//       Если установить Ложь, тогда поставляемые профили можно не только просматривать, но и редактировать.
//   * ОбновлятьГруппыДоступа     - Булево - начальное значение Истина.
//   * ОбновлятьГруппыДоступаСУстаревшимиНастройками - Булево - начальное значение Ложь.
//       Если установить Истина, то настройки значений, выполненные администратором для
//       вида доступа, который был удален из профиля, будут также удалены из групп доступа.
//
// Пример:
//  ОписаниеПрофиля = УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа();
//  ОписаниеПрофиля.Имя           = "Менеджер";
//  ОписаниеПрофиля.Идентификатор = "75fa0ecb-98aa-11df-b54f-e0cb4ed5f655";
//  ОписаниеПрофиля.Наименование  = НСтр("ru = 'Менеджер по продажам'", ОбщегоНазначения.КодОсновногоЯзыка());
//  ОписаниеПрофиля.Роли.Добавить("ЗапускВебКлиента");
//  ОписаниеПрофиля.Роли.Добавить("ЗапускТонкогоКлиента");
//  ОписаниеПрофиля.Роли.Добавить("БазовыеПраваБСП");
//  ОписаниеПрофиля.Роли.Добавить("Подсистема_Продажи");
//  ОписаниеПрофиля.Роли.Добавить("ДобавлениеИзменениеДокументовПокупателей");
//  ОписаниеПрофиля.Роли.Добавить("ПросмотрОтчетаКнигаПокупок");
//  ОписанияПрофилей.Добавить(ОписаниеПрофиля);
//
//  ОписаниеПапки = УправлениеДоступом.НовоеОписаниеПапкиПрофилейГруппДоступа();
//  ОписаниеПапки.Имя           = "ДополнительныеПрофили";
//  ОписаниеПапки.Идентификатор = "69a066e7-ce81-11eb-881c-b06ebfbf08c7";
//  ОписаниеПапки.Наименование  = НСтр("ru = 'Дополнительные профили'", ОбщегоНазначения.КодОсновногоЯзыка());
//  ОписанияПрофилей.Добавить(ОписаниеПапки);
//
//  ОписаниеПрофиля = УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа();
//  ОписаниеПрофиля.Родитель = "ДополнительныеПрофили";
//  ОписаниеПрофиля.Идентификатор = "70179f20-2315-11e6-9bff-d850e648b60c";
//  ОписаниеПрофиля.Наименование = НСтр("ru = 'Редактирование, отправка по почте, сохранение в файл печатных форм (дополнительно)'",
//  	ОбщегоНазначения.КодОсновногоЯзыка());
//  ОписаниеПрофиля.Описание = НСтр("ru = 'Дополнительно назначается пользователям, которым должна быть доступна возможность редактирования,
//  	|перед печатью, отправка по почте и сохранение в файл сформированных печатных форм.'");
//  ОписаниеПрофиля.Роли.Добавить("РедактированиеПечатныхФорм");
//  ОписанияПрофилей.Добавить(ОписаниеПрофиля);
//
Процедура ПриЗаполненииПоставляемыхПрофилейГруппДоступа(ОписанияПрофилей, ПараметрыОбновления) Экспорт
	
	ОписаниеПрофиля = УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа();
	ОписаниеПрофиля.Имя           = "Менеджер по продажам";
	ОписаниеПрофиля.Идентификатор = "21c30ab2-3d82-4f54-be4c-d303b5f826ea";
	ОписаниеПрофиля.Наименование  = НСтр("ru = 'Менеджер по продажам'", ОбщегоНазначения.КодОсновногоЯзыка());
	ОписаниеПрофиля.Роли.Добавить("ЗапускВебКлиента");
	ОписаниеПрофиля.Роли.Добавить("ЗапускТонкогоКлиента");
	ОписаниеПрофиля.Роли.Добавить("БазовыеПраваБСП");
	ОписаниеПрофиля.Роли.Добавить("ВыводНаПринтерФайлБуферОбмена");
	ОписаниеПрофиля.Роли.Добавить("ПросмотрСвязанныеДокументы");
	ОписаниеПрофиля.Роли.Добавить("СохранениеДанныхПользователя");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеВариантовОтчетов");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеДополнительныхОтчетовИОбработок");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеДополнительныхСведений");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеУчетныхЗаписейЭлектроннойПочты");
	ОписаниеПрофиля.Роли.Добавить("БазоваяФункциональностьТП");
	ОписаниеПрофиля.Роли.Добавить("ДобавлениеИзменениеКонтрагентов");
	ОписаниеПрофиля.Роли.Добавить("ДобавлениеИзменениеДокументовПродажи");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеВзаиморасчетовСПокупателями");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеНСИ");
	ОписанияПрофилей.Добавить(ОписаниеПрофиля);
	
	ОписаниеПрофиля = УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа();
	ОписаниеПрофиля.Имя           = "Менеджер по закупкам";
	ОписаниеПрофиля.Идентификатор = "0ab577d8-fbac-45a9-b44f-7a0ca3c96d2c";
	ОписаниеПрофиля.Наименование  = НСтр("ru = 'Менеджер по закупкам'", ОбщегоНазначения.КодОсновногоЯзыка());
	ОписаниеПрофиля.Роли.Добавить("ЗапускВебКлиента");
	ОписаниеПрофиля.Роли.Добавить("ЗапускТонкогоКлиента");
	ОписаниеПрофиля.Роли.Добавить("БазовыеПраваБСП");
	ОписаниеПрофиля.Роли.Добавить("ВыводНаПринтерФайлБуферОбмена");
	ОписаниеПрофиля.Роли.Добавить("ПросмотрСвязанныеДокументы");
	ОписаниеПрофиля.Роли.Добавить("СохранениеДанныхПользователя");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеВариантовОтчетов");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеДополнительныхОтчетовИОбработок");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеДополнительныхСведений");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеУчетныхЗаписейЭлектроннойПочты");
	ОписаниеПрофиля.Роли.Добавить("БазоваяФункциональностьТП");
	ОписаниеПрофиля.Роли.Добавить("ДобавлениеИзменениеКонтрагентов");
	ОписаниеПрофиля.Роли.Добавить("ДобавлениеИзменениеДокументовПокупки");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеВзаиморасчетовСПоставщиками");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеНСИ");
	ОписанияПрофилей.Добавить(ОписаниеПрофиля);
	
	ОписаниеПрофиля = УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа();
	ОписаниеПрофиля.Имя           = "Главный бухгалтер";
	ОписаниеПрофиля.Идентификатор = "0f2150dc-9fcd-4dcd-a1be-e5fe363efa73";
	ОписаниеПрофиля.Наименование  = НСтр("ru = 'Главный бухгалтер'", ОбщегоНазначения.КодОсновногоЯзыка());
	ОписаниеПрофиля.Роли.Добавить("ЗапускВебКлиента");
	ОписаниеПрофиля.Роли.Добавить("ЗапускТонкогоКлиента");
	ОписаниеПрофиля.Роли.Добавить("БазовыеПраваБСП");
	ОписаниеПрофиля.Роли.Добавить("ВыводНаПринтерФайлБуферОбмена");
	ОписаниеПрофиля.Роли.Добавить("ПросмотрСвязанныеДокументы");
	ОписаниеПрофиля.Роли.Добавить("СохранениеДанныхПользователя");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеВариантовОтчетов");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеДополнительныхОтчетовИОбработок");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеДополнительныхСведений");
	ОписаниеПрофиля.Роли.Добавить("ЧтениеУчетныхЗаписейЭлектроннойПочты");
	ОписаниеПрофиля.Роли.Добавить("БазоваяФункциональностьТП");
	ОписаниеПрофиля.Роли.Добавить("ДобавлениеИзменениеКонтрагентов");
	ОписаниеПрофиля.Роли.Добавить("ДобавлениеИзменениеДокументовПокупки");
	ОписаниеПрофиля.Роли.Добавить("ДобавлениеИзменениеДокументовПродажи");
	ОписаниеПрофиля.Роли.Добавить("ДобавлениеИзменениеНСИ");
	ОписаниеПрофиля.Роли.Добавить("ДобавлениеИзмененияДенежныхДокументов");
	ОписанияПрофилей.Добавить(ОписаниеПрофиля); 
	
	ОписаниеПрофиля = УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа();  
	ОписаниеПрофиля.Имя           = "Бухгалтер";
	ОписаниеПрофиля.Идентификатор = Новый УникальныйИдентификатор;
	ОписаниеПрофиля.Наименование  = НСтр("ru = 'Бухгалтер'", ОбщегоНазначения.КодОсновногоЯзыка());
	ОписаниеПрофиля.Роли.Добавить("Базовая функциональность ТП");
	ОписаниеПрофиля.Роли.Добавить("Базовые права БСП");
	ОписаниеПрофиля.Роли.Добавить("БазовыеПраваБСП");
	ОписаниеПрофиля.Роли.Добавить("ВКМ массовое создание документов");
	ОписаниеПрофиля.Роли.Добавить("ВКМ отчёт анализ выставленных актов");
	ОписаниеПрофиля.Роли.Добавить("ВКМ подсистема работа с клиентами");
	ОписаниеПрофиля.Роли.Добавить("ВКМ подсистема РУЗ");
	ОписаниеПрофиля.Роли.Добавить("ВКМ расчёт зарплаты");
	ОписаниеПрофиля.Роли.Добавить("Вывод на принтер, в файл, в буфер обмена");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение документов покупки");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение документов продажи");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение контрагентов");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение НСИ");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменения денежных документов");
	ОписаниеПрофиля.Роли.Добавить("Запуск веб-клиента");
	ОписаниеПрофиля.Роли.Добавить("Запуск тонкого клиента");
	ОписаниеПрофиля.Роли.Добавить("Просмотр связанные документы");
	ОписаниеПрофиля.Роли.Добавить("Сохранение данных пользователя");
    ОписаниеПрофиля.Роли.Добавить("Чтение вариантов отчетов");
	ОписаниеПрофиля.Роли.Добавить("Чтение дополнительных отчетов и обработок");
	ОписаниеПрофиля.Роли.Добавить("Чтение дополнительных сведений");
	ОписаниеПрофиля.Роли.Добавить("Чтение учетных записей электронной почты");
	ОписанияПрофилей.Добавить(ОписаниеПрофиля);    
		
	ОписаниеПрофиля = УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа();  
	ОписаниеПрофиля.Имя           = "КадровикРасчетчик";
	ОписаниеПрофиля.Идентификатор = Новый УникальныйИдентификатор;
	ОписаниеПрофиля.Наименование  = НСтр("ru = 'КадровикРасчетчик'", ОбщегоНазначения.КодОсновногоЯзыка());
	ОписаниеПрофиля.Роли.Добавить("Базовая функциональность ТП");
	ОписаниеПрофиля.Роли.Добавить("Базовые права БСП");
	ОписаниеПрофиля.Роли.Добавить("ВКМ выплата зарплаты");
	ОписаниеПрофиля.Роли.Добавить("ВКМ отчёт выработка специалистов");
	ОписаниеПрофиля.Роли.Добавить("ВКМ отчёты кадровиков");
	ОписаниеПрофиля.Роли.Добавить("ВКМ подсистема работа с клиентами");
	ОписаниеПрофиля.Роли.Добавить("ВКМ подсистема РУЗ");    
	ОписаниеПрофиля.Роли.Добавить("ВКМ расчёт зарплаты");
	ОписаниеПрофиля.Роли.Добавить("ВКМ_ПланированиеОтпусков");
	ОписаниеПрофиля.Роли.Добавить("Вывод на принтер, в файл, в буфер обмена");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение документов покупки");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение документов продажи");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение контрагентов");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение НСИ");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменения денежных документов");
	ОписаниеПрофиля.Роли.Добавить("Запуск веб-клиента");
	ОписаниеПрофиля.Роли.Добавить("Запуск тонкого клиента");
	ОписаниеПрофиля.Роли.Добавить("Просмотр связанные документы");
	ОписаниеПрофиля.Роли.Добавить("Сохранение данных пользователя");
    ОписаниеПрофиля.Роли.Добавить("Чтение вариантов отчетов");
	ОписаниеПрофиля.Роли.Добавить("Чтение дополнительных отчетов и обработок");
	ОписаниеПрофиля.Роли.Добавить("Чтение дополнительных сведений");
	ОписаниеПрофиля.Роли.Добавить("Чтение учетных записей электронной почты");
	ОписанияПрофилей.Добавить(ОписаниеПрофиля);  
	
	ОписаниеПрофиля = УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа();  
	ОписаниеПрофиля.Имя           = "Специалист";
	ОписаниеПрофиля.Идентификатор = Новый УникальныйИдентификатор;
	ОписаниеПрофиля.Наименование  = НСтр("ru = 'Специалист'", ОбщегоНазначения.КодОсновногоЯзыка());
	ОписаниеПрофиля.Роли.Добавить("Базовая функциональность ТП");
	ОписаниеПрофиля.Роли.Добавить("Базовые права БСП");
	ОписаниеПрофиля.Роли.Добавить("ВКМ документ обслуживание клиентов");
	ОписаниеПрофиля.Роли.Добавить("ВКМ использование ботов");
	ОписаниеПрофиля.Роли.Добавить("ВКМ отчёт выработка специалистов");
	ОписаниеПрофиля.Роли.Добавить("ВКМ подсистема работа с клиентами");
	ОписаниеПрофиля.Роли.Добавить("Вывод на принтер, в файл, в буфер обмена");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение документов покупки");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение документов продажи");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение контрагентов");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение НСИ");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменения денежных документов");
	ОписаниеПрофиля.Роли.Добавить("Запуск веб-клиента");
	ОписаниеПрофиля.Роли.Добавить("Запуск тонкого клиента");
	ОписаниеПрофиля.Роли.Добавить("Просмотр связанные документы");
	ОписаниеПрофиля.Роли.Добавить("Сохранение данных пользователя");
    ОписаниеПрофиля.Роли.Добавить("Чтение вариантов отчетов");
	ОписаниеПрофиля.Роли.Добавить("Чтение дополнительных отчетов и обработок");
	ОписаниеПрофиля.Роли.Добавить("Чтение дополнительных сведений");
	ОписаниеПрофиля.Роли.Добавить("Чтение учетных записей электронной почты");
	ОписанияПрофилей.Добавить(ОписаниеПрофиля); 
	
	ОписаниеПрофиля = УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа();  
	ОписаниеПрофиля.Имя           = "Менеджер";
	ОписаниеПрофиля.Идентификатор = Новый УникальныйИдентификатор;
	ОписаниеПрофиля.Наименование  = НСтр("ru = 'Менеджер'", ОбщегоНазначения.КодОсновногоЯзыка());
	ОписаниеПрофиля.Роли.Добавить("Базовая функциональность ТП");
	ОписаниеПрофиля.Роли.Добавить("Базовые права БСП");
	ОписаниеПрофиля.Роли.Добавить("ВКМ документ обслуживание клиентов");
	ОписаниеПрофиля.Роли.Добавить("ВКМ использование ботов");
	ОписаниеПрофиля.Роли.Добавить("ВКМ подсистема работа с клиентами");
	ОписаниеПрофиля.Роли.Добавить("Вывод на принтер, в файл, в буфер обмена");
	ОписаниеПрофиля.Роли.Добавить("Добавление и изменение вариантов отчетов");
	ОписаниеПрофиля.Роли.Добавить("Добавление и изменение видов контактной информации");
	ОписаниеПрофиля.Роли.Добавить("Добавление и изменение дополнительных реквизитов и сведений");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение документов покупки");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение документов продажи");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение контрагентов");
	ОписаниеПрофиля.Роли.Добавить("Добавление изменение НСИ");
	ОписаниеПрофиля.Роли.Добавить("Договор на абонентское обслуживание");
	ОписаниеПрофиля.Роли.Добавить("Запуск веб-клиента");
    ОписаниеПрофиля.Роли.Добавить("Запуск тонкого клиента");
	ОписаниеПрофиля.Роли.Добавить("Изменение дополнительных сведений");
	ОписаниеПрофиля.Роли.Добавить("Интерактивное открытие внешних отчетов и обработок");
	ОписаниеПрофиля.Роли.Добавить("Настройка синхронизации файлов"); 
	ОписаниеПрофиля.Роли.Добавить("Просмотр связанные документы");
	ОписаниеПрофиля.Роли.Добавить("Сохранение данных пользователя");
	ОписаниеПрофиля.Роли.Добавить("Чтение вариантов отчетов");
	ОписаниеПрофиля.Роли.Добавить("Чтение дополнительных отчетов и обработок");
	ОписаниеПрофиля.Роли.Добавить("Чтение дополнительных сведений");
	ОписаниеПрофиля.Роли.Добавить("Чтение НСИ");
	ОписаниеПрофиля.Роли.Добавить("Чтение учетных записей электронной почты");
	ОписанияПрофилей.Добавить(ОписаниеПрофиля);
	
КонецПроцедуры
