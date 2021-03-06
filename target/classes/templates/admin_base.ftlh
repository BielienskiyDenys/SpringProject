<#import "parts/common.ftlh" as c>
<#import "parts/navbar.ftlh" as n>
<#import "parts/pager.ftlh" as p>
<#import "/spring.ftl" as spring>

<@c.page>
    <@n.navbar>
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
            <a class="nav-link" href="/admin_base?lang=uk_UA"><@spring.message "header.switchUk"/></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin_base?lang=en_US"><@spring.message "header.swithEng"/></a>
        </li>
        <li class="nav-item">
            <@n.logout/>
        </li>
    </@n.navbar>
    <div class="container mt-5">
        <div class="mt-3 mb-3">
            <h2><@spring.message "pagename.admin_page"/></h2>
        </div>


        <div class="row mt-3 mb-3">
            <div class="col">
                <h5><@spring.message "form.find_exhibition"/></h5>
            </div>
        </div>

        <div class="container">
            <div class="row mt-3 mb-3">
                <form class="col" id="searchByName" method="get" action="filter_ex_by_name_admin">
                    <div class="input-group mb-3">
                        <input type="text" name="filterByName" class="form-control"
                               placeholder="<@spring.message "form.name"/>:">
                        <div class="input-group-append">
                            <button type="submit"
                                    class="btn btn-outline-secondary"><@spring.message "button.find"/></button>
                        </div>
                    </div>
                </form>

                <form class="col" id="searchByTheme" method="get" action="filter_ex_by_theme_admin">
                    <div class="input-group mb-3">
                        <input type="text" name="filterByTheme" class="form-control"
                               placeholder="<@spring.message "form.theme"/>:">
                        <div class="input-group-append">
                            <button type="submit"
                                    class="btn btn-outline-secondary"><@spring.message "button.find"/></button>
                        </div>
                    </div>
                </form>

                <form class="col" id="searchByStatus" method="get" action="filter_ex_by_status_admin">
                    <div class="input-group">
                        <div class="input-group-prepend">
                        <span class="input-group-text"><@spring.message "form.status"/>
                        </span>
                        </div>
                        <select class="custom-select" size="1" name="filterByStatus" class="form-control">
                            <option value="ACTIVE"><@spring.message "value.active"/></option>
                            <option value="CANCELED"><@spring.message "value.canceled"/></option>
                            <option value="ENDED"><@spring.message "value.ended"/></option>
                        </select>
                        <div class="input-group-append">
                            <button type="submit"
                                    class="btn btn-outline-secondary"><@spring.message "button.find"/></button>
                        </div>
                    </div>
                </form>

            </div>

            <div class="row mt-3 mb-3">

                <form class="col" id="searchByPrice" method="get" action="filter_ex_by_price_admin">
                    <div class="input-group">
                        <div class="input-group-prepend">
                                   <span class="input-group-text"><@spring.message "form.ticket_price"/>
                                       :</span>
                        </div>
                        <input type="text" name="filterByPriceFrom" class="form-control"
                               required="required">
                        <input type="text" name="filterByPriceUpTo" class="form-control"
                               required="required">
                        <div class="input-group-append">
                            <button type="submit"
                                    class="btn btn-outline-secondary"><@spring.message "button.find"/></button>
                        </div>
                    </div>
                </form>

                <form class="col" id="searchByDate" method="get" action="/filter_ex_by_date_admin">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><@spring.message "form.date"/>:</span>
                        </div>
                        <input type="date" name="filterByDateStart" class="form-control" required="required">

                        <input type="date" name="filterByDateEnd" class="form-control" required="required">
                        <div class="input-group-append">
                            <button type="submit"
                                    class="btn btn-outline-secondary"><@spring.message "button.find"/></button>
                        </div>
                    </div>
                </form>

            </div>

            <div class="row mt-4 mb-4">
                <div class="col">
                    <#if searchResult??>
                        <h4>${searchResult}</h4>
                    </#if>
                </div>
            </div>

            <#if exhibitions??>
                <@p.pager url exhibitions />
                <#list exhibitions.content as exhibition>
                    <div class="card" style="width: 100%;">
                        <div class="card-body">

                            <h5 class="card-title">
                                # ${exhibition.id} &nbsp;&nbsp;&nbsp;
                                <#if .locale == "en_US">
                                    ${exhibition.exNameEng}&nbsp;&nbsp;&nbsp;
                                <#else>
                                    ${exhibition.exNameNative}&nbsp;&nbsp;&nbsp;
                                </#if>
                            </h5>

                            <#list exhibition.hallScheduleList as hallSchedule>
                                <h6 class="card-subtitle mb-2 text-muted">
                                    <span><@spring.message "form.hall"/>:&nbsp${hallSchedule.hallName}</span>&nbsp&nbsp&nbsp
                                    <span><@spring.message "form.start_date"/>: &nbsp${hallSchedule.startDateAsString}</span>&nbsp&nbsp&nbsp
                                    <span><@spring.message "form.end_date"/>:&nbsp${hallSchedule.endDateAsString}</span>
                                </h6>
                            </#list>

                            <p class="card-text">
                                <@spring.message "form.opening_hours"/>:
                                <span>${exhibition.openTime}</span>
                                -
                                <span>${exhibition.closeTime}</span>
                            </p>

                            <#if .locale == "en_US">
                                <p class="card-text">
                                    ${exhibition.descriptionEng}
                                </p>
                                <p class="card-text">
                                    ${exhibition.themesEng}
                                </p>
                            <#else>
                                <p class="card-text">
                                    ${exhibition.descriptionNative}
                                </p>
                                <p class="card-text">
                                    ${exhibition.themesNative}
                                </p>
                            </#if>

                            <p class="card-text">
                                <@spring.message "form.ticket_price"/>:
                                <span>${exhibition.ticketPrice}</span>
                            </p>
                            <form action="buy_ticket_admin" method="post" class="form-inline">
                                <select size="1" name="ticketQuantity" id="ticketQuantity" class="form-control">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                                <input type="hidden" name="exhibitionId" value="${exhibition.id}"/>
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit"
                                        class="btn btn-outline-secondary"><@spring.message "button.buy_ticket"/></button>
                            </form>
                        </div>
                    </div>
                </#list>
                <@p.pager url exhibitions />
            <#else>
            </#if>


            <#if halls_with_exhibitions??>
                <#list halls_with_exhibitions as hall_with_exhibition>
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                            <h5 class="card-title">
                                # ${hall_with_exhibition.exhibition.getId()}
                                <#if .locale == "en_US">
                                    ${hall_with_exhibition.exhibition.getExNameEng()}
                                <#else>
                                    ${hall_with_exhibition.exhibition.getExNameNative()}
                                </#if>
                            </h5>
                            <h6 class="card-subtitle mb-2 text-muted">
                                <span><@spring.message "form.hall"/>:&nbsp${hall_with_exhibition.hallName}</span>&nbsp&nbsp&nbsp
                                <span><@spring.message "form.start_date"/>: &nbsp${hall_with_exhibition.startDateAsString}</span>&nbsp&nbsp&nbsp
                                <span><@spring.message "form.end_date"/>:&nbsp${hall_with_exhibition.endDateAsString}</span>
                            </h6>
                            <p class="card-text">
                                <@spring.message "form.opening_hours"/>:
                                <span>${hall_with_exhibition.exhibition.getOpenTime()}</span>
                                -
                                <span>${hall_with_exhibition.exhibition.getCloseTime()}</span>
                            </p>

                            <#if .locale == "en_US">
                                <p class="card-text">
                                    ${hall_with_exhibition.exhibition.getDescriptionEng()}
                                </p>
                                <p class="card-text">
                                    ${hall_with_exhibition.exhibition.getThemesEng()}
                                </p>
                            <#else>
                                <p class="card-text">
                                    ${hall_with_exhibition.exhibition.getDescriptionNative()}
                                </p>
                                <p class="card-text">
                                    ${hall_with_exhibition.exhibition.getThemesNative()}
                                </p>
                            </#if>
                            <p class="card-text">
                                <@spring.message "form.ticket_price"/>:
                                <span>${hall_with_exhibition.exhibition.getTicketPrice()}</span>
                            </p>
                            <form action="buy_ticket_admin" method="post" class="form-inline">
                                <select size="1" name="ticketQuantity" id="ticketQuantity" class="form-control">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                                <input type="hidden" name="exhibitionId"
                                       value="${hall_with_exhibition.exhibition.id}"/>
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit"
                                        class="btn btn-outline-secondary"><@spring.message "button.buy_ticket"/></button>
                            </form>
                        </div>
                    </div>
                </#list>
            <#else>
            </#if>
        </div>


        <div class="row">
            <div class="col">
                <h5><@spring.message "form.find_tickets"/></h5>
            </div>
        </div>

        <div class="container">
            <div class="row mt-3 mb-3">
                <div class="col">
                    <form id="searchMyTickets" method="get" action="find_my_tickets_admin">
                        <button type="submit"
                                class="btn btn-outline-secondary"><@spring.message "button.show_my_tickets"/></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</@c.page>