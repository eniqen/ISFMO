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

    public static final String BIRTH_DATE = "Дата рождения: ";
    public static final String EMAIL = "E-mail: ";
    public static final String MAIN_EDU = "Основное образование: ";
    public static final String PRIOR_WORKPLACE = "Предыдущее место работы: ";
    public static final String ADD_EDU = "Дополнительное образование: ";
    public static final String ADD_SKILLS = "Дополнительные навыки: ";
    public static final String PROF_EXP = "Профессиональный опыт: ";
    public static final String CONTACT_INFO = "Контактная информация: ";
    public static final String ADD_INFO = "Дополнительная информация: ";
    public static final String HAS_CHILDREN = "Есть дети: ";
    public static final String READY_FOR_RELOCATION = "Готовность к переезду: ";
    private static final char CHECKED = '\u00FE';
    private static final char UNCHECKED = '\u00A8';

    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception {

        Contract contract = (Contract) request.getAttribute("contract");

        Paragraph addInfo = new Paragraph();
        addInfo.add(new Chunk("HUEKST" + contract.getClient().getEmail()));
        document.add(addInfo);
        document.close();
        writer.close();
    }
}
