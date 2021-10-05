USE `printersetupsystem`;

CREATE TABLE `installscripts` (
  `id` int(5) NOT NULL,
  `name` text NOT NULL DEFAULT '', 
  `extension` text NOT NULL DEFAULT '',
  `value` longtext NOT NULL DEFAULT '\'\\\'\\\'\''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `installscripts` (`id`, `name`, `extension`, `value`) VALUES
(1, 'test script', 'vbs', 'printerName = \"%PRINTER_SHARE_NAME%\"\r\n\r\nSet objExplorer = CreateObject(\"InternetExplorer.Application\")\r\n\r\nobjExplorer.Navigate \"about:blank\"  \r\nobjExplorer.ToolBar = 0\r\nobjExplorer.StatusBar = 0\r\nobjExplorer.Left = 500\r\nobjExplorer.Top = 250\r\nobjExplorer.Width = 500\r\nobjExplorer.Height = 220\r\nobjExplorer.Visible = 1\r\n\r\nobjExplorer.Document.Title = \"Installation of the printer\"\r\nobjExplorer.Document.Body.InnerHTML = \"<table style=\"\"width:100%\"\"><tr><td id=\"\"progress\"\" style=\"\"font-family:Segoe UI;text-align: center;font-size:48px;border-bottom:1px solid black;\"\">Installing printer: 0%</td></tr><tr><td style=\"\"font-family:Segoe UI;text-align: center;font-size:22px;\"\">\" & printerName & \"</td></tr></table>\"\r\n\r\nWscript.Sleep 500\r\nobjExplorer.document.getElementById(\"progress\").innerText = \"Installing printer: 10%\"\r\n\r\nSet WshNetwork = CreateObject(\"WScript.Network\")\r\nWshNetwork.AddWindowsPrinterConnection printerName\r\nWSHNetwork.SetDefaultPrinter printerName\r\n\r\nWscript.Sleep 200\r\nobjExplorer.document.getElementById(\"progress\").innerText = \"Installing printer: 20%\"\r\n\r\nWscript.Sleep 200\r\nobjExplorer.document.getElementById(\"progress\").innerText = \"Installing printer: 40%\"\r\n\r\nWscript.Sleep 200\r\nobjExplorer.document.getElementById(\"progress\").innerText = \"Installing printer: 60%\"\r\n\r\nWscript.Sleep 200\r\nobjExplorer.document.getElementById(\"progress\").innerText = \"Installing printer: 80%\"\r\n\r\nWscript.Sleep 100\r\nobjExplorer.document.getElementById(\"progress\").innerText = \"Printer installed!\"\r\n\r\nWscript.Sleep 3000\r\nobjExplorer.Quit');

ALTER TABLE `installscripts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `installscripts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
