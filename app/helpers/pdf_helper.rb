module PDFHelper
  include Redmine::Export::PDF

def functional_requirements_to_pdf
    pdf = ITCPDF.new(current_language)
    pdf.SetTitle("#{@project.name}- #{Date.today}")
   # pdf.SetAuthor('Nome do Autor')
    pdf.AliasNbPages
    pdf.footer_date = format_date(Date.today)
    pdf.AddPage

    pdf.SetFontStyle('B',16)
    pdf.Cell(200,5, @project.name)

    pdf.Ln(10)
    pdf.SetFontStyle('',11)
    pdf.MultiCell(180,5, l(:functional_requirements))
    pdf.Ln


       # Landscape A4 = 210 x 297 mm
        page_height   = 210
        page_width    = 297
        right_margin  = 10
        bottom_margin = 20
        col_id_width  = 10
        row_height    = 5

  pdf.SetFontStyle('',9)
    @functional_requirements.each do |functional_requirement|

   pdf.MultiCell(180,5, "#{functional_requirement.name.capitalize}  (#{functional_requirement.hidden ? "Oculto" : "Evidente"}):")
   pdf.SetFontStyle('',9)
   pdf.MultiCell(180,5, functional_requirement.description)

   pdf.Ln

 end
   # pdf.Line(pdf.GetX, pdf.GetY, 100, pdf.GetY)
   # pdf.SetFontStyle('I',8)
   # pdf.Cell(200,5, 'Auto generated faq-list by ezFAQ. Powered by ezWORK & Redmine.')

    pdf.Output
  end

   # Draw lines to close the row (MultiCell border drawing in not uniform)
  def draw_borders(pdf, top_x, top_y, lower_y,
                                     id_width, col_widths)
        col_x = top_x + id_width
        pdf.Line(col_x, top_y, col_x, lower_y)    # id right border
        col_widths.each do |width|
          col_x += width
          pdf.Line(col_x, top_y, col_x, lower_y)  # columns right border
        end
        pdf.Line(top_x, top_y, top_x, lower_y)    # left border
        pdf.Line(top_x, lower_y, col_x, lower_y)  # bottom border
  end

   # Renders MultiCells and returns the maximum height used
      def functional_requirement_to_pdf_write_cells(pdf, col_values, col_widths,
                                    row_height, head=false)
        base_y = pdf.GetY
        max_height = row_height
        col_values.each_with_index do |column, i|
          col_x = pdf.GetX
          if head == true
            pdf.RDMMultiCell(col_widths[i], row_height, column.caption, "T", 'L', 1)
          else
            pdf.RDMMultiCell(col_widths[i], row_height, column, "T", 'L', 1)
          end
          max_height = (pdf.GetY - base_y) if (pdf.GetY - base_y) > max_height
          pdf.SetXY(col_x + col_widths[i], base_y);
        end
        return max_height
      end


end

