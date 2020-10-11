<#import "parts/common.ftlh" as c>
<#import "parts/navbar.ftlh" as n>
<#import "parts/pager.ftlh" as p>
<#import "/spring.ftl" as spring>

<@c.page>
    <@n.navbar>
        <li class="nav-item" xmlns="http://www.w3.org/1999/html">
            <a class="nav-link"
               href="/main?lang=${springMacroRequestContext.locale}"><@spring.message "header.home"/></a>
        </li>
        <li class="nav-item" xmlns="http://www.w3.org/1999/html">
            <a class="nav-link"
               href="/admin_base?lang=${springMacroRequestContext.locale}"><@spring.message "header.home"/></a>
        </li>
        <li class="nav-item" xmlns="http://www.w3.org/1999/html">
            <a class="nav-link"
               href="/admin_exhibition_management?lang=${springMacroRequestContext.locale}"><@spring.message "admin.exhibitions_managment"/></a>
        </li>
        <li class="nav-item" xmlns="http://www.w3.org/1999/html">
            <a class="nav-link"
               href="/admin_tickets_management?lang=${springMacroRequestContext.locale}"><@spring.message "admin.tickets_managment"/></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin_exhibition_management?lang=uk_UA"><@spring.message "header.switchUk"/></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin_exhibition_management?lang=en_US"><@spring.message "header.swithEng"/></a>
        </li>
        <li class="nav-item">
            <@n.logout/>
        </li>
    </@n.navbar>
    <div class="container mt-5">
        <div class="mt-3 mb-3">
            <h2><@spring.message "admin.exhibitions_managment"/></h2>
        </div>

        <div class="row">
            <div class="col">
                <h5><@spring.message "form.create_exhibit"/></h5>
            </div>
        </div>


        <form action="/add_exhibition" class="container" method="post">

            <div class="row mt-3 mb-3">
                <div class="col">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.ex_name_eng"/>:
                            </span>
                        </div>
                        <input type="text" name="exNameEng" id="exNameEng" class="form-control" required="required"/>
                    </div>
                </div>
                <div class="col">
                    <div class="input-group">
                        <div class="input-group-prepend">
                             <span class="input-group-text">
                             <@spring.message "form.ex_name_nat"/>:
                             </span>
                        </div>
                        <input type="text" name="exNameNative" id="exNameNative" class="form-control"
                               required="required"/>
                    </div>
                </div>
            </div>

            <div class="row mt-3 mb-3">
                <div class="col">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.open_time"/>:
                            </span>
                        </div>
                        <input type="time" name="openTime" class="form-control" required="required" id="openTime"/>
                    </div>
                </div>
                <div class="col">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.close_time"/>:
                            </span>
                        </div>
                        <input type="time" name="closeTime" class="form-control" required="required" id="closeTime"/>
                    </div>
                </div>
                <div class="col">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.ticket_price"/>:
                            </span>
                        </div>
                        <input type="text" name="ticketPrice" id="ticketPrice" class="form-control"
                               required="required"/>
                    </div>
                </div>
            </div>

            <div class="row mt-3 mb-3">
                <div class="col">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.desc_eng"/>:
                            </span>
                        </div>
                        <input type="text" name="descriptionEng" id="descriptionEng" class="form-control"
                               required="required"/>
                    </div>
                </div>
            </div>

            <div class="row mt-3 mb-3">
                <div class="col">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.desc_nat"/>:
                            </span>
                        </div>
                        <input type="text" name="descriptionNative" id="descriptionNative" class="form-control"
                               required="required"/>
                    </div>
                </div>
            </div>

            <div class="row mt-3 mb-3">
                <div class="col">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.themes_eng"/>:
                            </span>
                        </div>
                        <input type="text" name="themesEng" id="themesEng" class="form-control" required="required"/>
                    </div>
                </div>
                <div class="col">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.themes_nat"/>:
                            </span>
                        </div>
                        <input type="text" name="themesNative" id="themesNative" class="form-control"
                               required="required"/>
                    </div>
                </div>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-outline-secondary"><@spring.message "button.create_ex"/></button>


            <div class="row mt-5 mb-5">
                <#if exhibition_added??>
                    <table class="table table-hover">

                        <h5><@spring.message "message.ex_created"/>:</h5>
                        <thead>
                        <tr>
                            <th scope="col"><@spring.message "form.ex_name_eng"/></th>
                            <th scope="col"><@spring.message "form.ex_name_nat"/></th>
                            <th scope="col"><@spring.message "form.ticket_price"/></th>
                        </tr>
                        </thead>

                        <tbody>
                        <tr>
                            <th scope="row">${exhibition_added.id}</th>
                            <td>${exhibition_added.exNameEng}</td>
                            <td>${exhibition_added.exNameNative}</td>
                            <td>${exhibition_added.ticketPrice}</td>
                        </tr>
                        </tbody>
                    </table>
                </#if>
            </div>
        </form>

        <div class="row">
            <div class="col">
                <#if errormessage??>
                    <h4>${errormessage}</h4>
                </#if>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <h5><@spring.message "form.cancel_exhibit"/>:</h5>
            </div>
        </div>


        <div class="row">
            <form action="/cancel_exhibition" method="post" class="container">
                <div class="col">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.enter_ex_id"/>:
                            </span>
                        </div>
                        <input type="text" name="exhibitionId" id="exhibitionId" class="form-control"
                               required="required">
                        <div class="input-group-append">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit"
                                    class="btn btn-outline-secondary"><@spring.message "button.cancel"/></button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="row">
            <#if cancel_exhibition_message??>
                <h4>${cancel_exhibition_message}</h4>
            </#if>
        </div>


        <div class="container">
            <form action="/add_exhibition_to_hall" method="post">
                <div class="row mt-3 mb-3">
                    <h5><@spring.message "form.assign_ex_to_hall"/></h5>
                </div>

                <div class="row mt-3 mb-3">
                    <div class="col">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.enter_ex_id"/>:
                            </span>
                            </div>
                            <input type="text" name="exhibitionId" id="exhibitionId" class="form-control"
                                   required="required"/>
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text">
                                <@spring.message "form.assign_a_hall"/>:
                            </span>
                            </div>
                            <select name="hallName" size="1" id="hallName" class="custom-select">
                                <option value="0"><@spring.message "hall.red"/></option>
                                <option value="1"><@spring.message "hall.yellow"/></option>
                                <option value="2"><@spring.message "hall.blue"/></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row mt-3 mb-3">
                    <div class="col">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.start_date"/>:
                            </span>
                            </div>
                            <input type="date" name="startDate" id="startDate" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="col">
                        <div class="input-group">
                            <div class="input-group-prepend">
                            <span class="input-group-text">
                            <@spring.message "form.end_date"/>:
                            </span>
                            </div>
                            <input type="date" name="endDate" id="endDate" class="form-control" required="required">
                        </div>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-outline-secondary"><@spring.message "button.assign"/></button>


                <div class="row mt-3 mb-3">
                    <#if hall_error??>
                        <h4>${hall_error}</h4>
                    </#if>
                    <#if hall_added??>
                        <h4>${hall_added}</h4>
                    </#if>
                </div>
            </form>

        </div>

    </div>

</@c.page>