package org.bitbucket.eniqen.util;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.CFFFont;
import com.itextpdf.text.pdf.PdfWriter;
import org.bitbucket.eniqen.model.Contract;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Map;

/**
 * Created by Mikhail on 31.01.2016.
 */
public class PdfBuilder extends AbstractPdfView {

    public static final String CONTRACT_WITH_NUMBER = "Договор №";
    public static final String PHONE_NUMBER = "Номер телефона: ";
    public static final String TARIFF = "Наименование тарифа: ";
    public static final String BIRTH_DATE = "Дата рождения: ";
    public static final String PASSPORT = "Номер паспорта: ";
    public static final String EMAIL = "E-mail: ";
    public static final String ADD_EDU = "Дополнительное образование: ";
    public static final String CONTACT_INFO = "Контактная информация: ";
    public static final String ADD_INFO = "Дополнительная информация: ";
    private static final char CHECKED = '\u00FE';
    private static final char UNCHECKED = '\u00A8';

    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception {

        Contract contract = (Contract) request.getAttribute("contract");

        Paragraph addInfo = new Paragraph();
        addInfo.add(new Chunk("TTTT " + contract.getClient().getEmail()));
        document.add(addInfo);
        Paragraph header = new Paragraph(new Chunk("Договор №" + contract.getId(), FontFactory.getFont(FontFactory.TIMES, 20)));
        document.add(header);
        Paragraph by = new Paragraph(new Chunk("Author " + contract.getClient().getLastname() + " " + contract.getClient().getFirstname(), FontFactory.getFont(FontFactory.HELVETICA, 20)));

        document.add(by);

        document.close();
        writer.close();
    }
}
